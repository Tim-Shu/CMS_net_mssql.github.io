﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QJcms.Common;

namespace QJcms.Web.admin.users
{
    public partial class user_edit : Web.UI.ManagePage
    {
        string defaultpassword = "0|0|0|0"; //默认显示密码
        protected string action = QJEnums.ActionEnum.Add.ToString(); //操作类型
        private int id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string _action = QJRequest.GetQueryString("action");
            if (!string.IsNullOrEmpty(_action) && _action == QJEnums.ActionEnum.Edit.ToString())
            {
                this.action = QJEnums.ActionEnum.Edit.ToString();//修改类型
                this.id = QJRequest.GetQueryInt("id");
                if (this.id == 0)
                {
                    JscriptMsg("传输参数不正确！", "back", "Error");
                    return;
                }
                if (!new BLL.users().Exists(this.id))
                {
                    JscriptMsg("信息不存在或已被删除！", "back", "Error");
                    return;
                }
            }
            BindFun();
            if (!Page.IsPostBack)
            {
                ChkAdminLevel("user_list", QJEnums.ActionEnum.View.ToString()); //检查权限
                TreeBind("is_lock=0"); //绑定类别
                if (action == QJEnums.ActionEnum.Edit.ToString()) //修改
                {
                    ShowInfo(this.id);
                }
            }
        }

        private void BindFun()
        {
            if (siteConfig.membergroupstatus == 0) { dlGroup.Visible = false; }//会员组
            if (siteConfig.memberavatarstatus == 0) { dlAvatar.Visible = false; }//会员头像
            if (siteConfig.memberpointstatus == 0) { dlPoint.Visible = false; }//会员积分
            if (siteConfig.memberlevelstatus == 0) { dlLevel.Visible = false; }//会员等级
            if (siteConfig.memberamountstatus == 0) { dlAmount.Visible = false; }//账户余额
        }

        #region 绑定类别=================================
        private void TreeBind(string strWhere)
        {
            BLL.user_groups bll = new BLL.user_groups();
            DataTable dt = bll.GetList(0, strWhere, "grade asc,id asc").Tables[0];

            this.ddlGroupId.Items.Clear();
            this.ddlGroupId.Items.Add(new ListItem("请选择组别...", ""));
            foreach (DataRow dr in dt.Rows)
            {
                this.ddlGroupId.Items.Add(new ListItem(dr["title"].ToString(), dr["id"].ToString()));
            }
        }
        #endregion

        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.users bll = new BLL.users();
            Model.users model = bll.GetModel(_id);

            ddlGroupId.SelectedValue = model.group_id.ToString();
            rblStatus.SelectedValue = model.status.ToString();
            txtUserName.Text = model.user_name;
            txtUserName.ReadOnly = true;
            txtUserName.Attributes.Remove("ajaxurl");
            if (!string.IsNullOrEmpty(model.password))
            {
                txtPassword.Attributes["value"] = txtPassword1.Attributes["value"] = defaultpassword;
            }
            txtEmail.Text = model.email;
            txtNickName.Text = model.nick_name;
            txtAvatar.Text = model.avatar;
            rblSex.SelectedValue = model.sex;
            if (model.birthday != null)
            {
                txtBirthday.Text = model.birthday.ToString("yyyy-M-d");
            }
            txtTelphone.Text = model.telphone;
            txtMobile.Text = model.mobile;
            txtQQ.Text = model.qq;
            txtAddress.Text = model.address;
            txtAmount.Text = model.amount.ToString();
            txtPoint.Text = model.point.ToString();
            txtExp.Text = model.exp.ToString();
            lblRegTime.Text = model.reg_time.ToString();
            lblRegIP.Text = model.reg_ip.ToString();
            //查找最近登录信息
            Model.user_login_log logModel = new BLL.user_login_log().GetLastModel(model.user_name);
            if (logModel != null)
            {
                lblLastTime.Text = logModel.login_time.ToString();
                lblLastIP.Text = logModel.login_ip;
            }
        }
        #endregion

        #region 增加操作=================================
        private bool DoAdd()
        {
            bool result = false;
            Model.users model = new Model.users();
            BLL.users bll = new BLL.users();
            model.status = int.Parse(rblStatus.SelectedValue);
            //检测用户名是否重复
            if (bll.Exists(txtUserName.Text.Trim()))
            {
                return false;
            }
            model.user_name = Utils.DropHTML(txtUserName.Text.Trim());
            //获得6位的salt加密字符串
            model.salt = Utils.GetCheckCode(6);
            //以随机生成的6位字符串做为密钥加密
            model.password = DESEncrypt.Encrypt(txtPassword.Text.Trim(), model.salt);
            model.email = Utils.DropHTML(txtEmail.Text);
            model.nick_name = Utils.DropHTML(txtNickName.Text);
            model.sex = rblSex.SelectedValue;
            DateTime _birthday;
            if (DateTime.TryParse(txtBirthday.Text.Trim(), out _birthday))
            {
                model.birthday = _birthday;
            }
            model.telphone = Utils.DropHTML(txtTelphone.Text.Trim());
            model.mobile = Utils.DropHTML(txtMobile.Text.Trim());
            model.qq = Utils.DropHTML(txtQQ.Text);
            model.address = Utils.DropHTML(txtAddress.Text.Trim());
            model.reg_time = DateTime.Now;
            model.reg_ip = QJRequest.GetIP();

            if (siteConfig.membergroupstatus == 1) { model.group_id = int.Parse(ddlGroupId.SelectedValue); }
            if (siteConfig.memberavatarstatus == 1) { model.avatar = Utils.DropHTML(txtAvatar.Text); }
            if (siteConfig.memberamountstatus == 1) { model.amount = decimal.Parse(txtAmount.Text.Trim()); }
            if (siteConfig.memberpointstatus == 1) { model.point = int.Parse(txtPoint.Text.Trim()); }
            if (siteConfig.memberlevelstatus == 1) { model.exp = int.Parse(txtExp.Text.Trim()); }

            if (bll.Add(model) > 0)
            {
                AddAdminLog(QJEnums.ActionEnum.Add.ToString(), "添加用户:" + model.user_name); //记录日志
                result = true;
            }
            return result;
        }
        #endregion

        #region 修改操作=================================
        private bool DoEdit(int _id)
        {
            bool result = false;
            BLL.users bll = new BLL.users();
            Model.users model = bll.GetModel(_id);
            model.status = int.Parse(rblStatus.SelectedValue);
            //判断密码是否更改
            if (txtPassword.Text.Trim() != defaultpassword)
            {
                //获取用户已生成的salt作为密钥加密
                model.password = DESEncrypt.Encrypt(txtPassword.Text.Trim(), model.salt);
            }
            model.email = Utils.DropHTML(txtEmail.Text);
            model.nick_name = Utils.DropHTML(txtNickName.Text);

            model.sex = rblSex.SelectedValue;
            DateTime _birthday;
            if (DateTime.TryParse(txtBirthday.Text.Trim(), out _birthday))
            {
                model.birthday = _birthday;
            }
            model.telphone = Utils.DropHTML(txtTelphone.Text.Trim());
            model.mobile = Utils.DropHTML(txtMobile.Text.Trim());
            model.qq = Utils.DropHTML(txtQQ.Text);
            model.address = Utils.DropHTML(txtAddress.Text.Trim());

            if (siteConfig.membergroupstatus == 1) { model.group_id = int.Parse(ddlGroupId.SelectedValue); }
            if (siteConfig.memberavatarstatus == 1) { model.avatar = Utils.DropHTML(txtAvatar.Text); }
            if (siteConfig.memberamountstatus == 1) { model.amount = Utils.StrToDecimal(txtAmount.Text.Trim(), 0); }
            if (siteConfig.memberpointstatus == 1) { model.point = Utils.StrToInt(txtPoint.Text.Trim(), 0); }
            if (siteConfig.memberlevelstatus == 1) { model.exp = Utils.StrToInt(txtExp.Text.Trim(), 0); }

            if (bll.Update(model))
            {
                AddAdminLog(QJEnums.ActionEnum.Edit.ToString(), "修改用户信息:" + model.user_name); //记录日志
                result = true;
            }
            return result;
        }
        #endregion

        //保存
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (action == QJEnums.ActionEnum.Edit.ToString()) //修改
            {
                ChkAdminLevel("user_list", QJEnums.ActionEnum.Edit.ToString()); //检查权限
                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误！", "", "Error");
                    return;
                }
                JscriptMsg("修改用户成功！", "user_list.aspx", "Success");
            }
            else //添加
            {
                ChkAdminLevel("user_list", QJEnums.ActionEnum.Add.ToString()); //检查权限
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误！", "", "Error");
                    return;
                }
                JscriptMsg("添加用户成功！", "user_list.aspx", "Success");
            }
        }
    }
}