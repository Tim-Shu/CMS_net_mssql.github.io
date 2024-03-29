﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QJcms.Common;

namespace QJcms.Web.admin.plugin
{
    public partial class serv_group_edit : QJcms.Web.UI.ManagePage
    {
        private string action = QJEnums.ActionEnum.Add.ToString(); //操作类型
        protected int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            string _action = QJRequest.GetQueryString("action");
            if (!string.IsNullOrEmpty(_action) && _action == QJEnums.ActionEnum.Edit.ToString())
            {
                this.action = QJEnums.ActionEnum.Edit.ToString();//修改类型
                this.id = QJRequest.GetQueryInt("id");
                if (this.id < 1)
                {
                    JscriptMsg("传输参数不正确！", "back", "Error");
                    return;
                }
                if (!new BLL.online_service_group().Exists(this.id))
                {
                    JscriptMsg("信息不存在或已被删除！", "back", "Error");
                    return;
                }
            }
            if (!Page.IsPostBack)
            {
                ChkAdminLevel("tools_server", QJEnums.ActionEnum.View.ToString()); //检查权限
                if (action == QJEnums.ActionEnum.Edit.ToString()) //修改
                {
                    ShowInfo(this.id);
                }
            }
        }

        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.online_service_group bll = new BLL.online_service_group();
            Model.online_service_group model = bll.GetModel(_id);

            txtTitle.Text = model.title;
            rblDefaultView.SelectedValue = model.default_view.ToString();
            rblIsLock.SelectedValue = model.is_lock.ToString();
            txtSortId.Text = model.sort_id.ToString();
        }
        #endregion

        #region 增加操作=================================
        private bool DoAdd()
        {
            bool result = false;
            Model.online_service_group model = new Model.online_service_group();
            BLL.online_service_group bll = new BLL.online_service_group();

            model.title = txtTitle.Text.Trim();
            model.default_view = int.Parse(rblDefaultView.SelectedValue);
            model.sort_id = int.Parse(txtSortId.Text.Trim());
            model.is_lock = int.Parse(rblIsLock.SelectedValue);

            if (bll.Add(model) > 0)
            {
                AddAdminLog(QJEnums.ActionEnum.Add.ToString(), "添加在线客服分组：" + model.title); //记录日志
                result = true;
            }
            return result;
        }
        #endregion

        #region 修改操作=================================
        private bool DoEdit(int _id)
        {
            bool result = false;
            BLL.online_service_group bll = new BLL.online_service_group();
            Model.online_service_group model = bll.GetModel(_id);

            model.title = txtTitle.Text.Trim();
            model.default_view = int.Parse(rblDefaultView.SelectedValue);
            model.sort_id = int.Parse(txtSortId.Text.Trim());
            model.is_lock = int.Parse(rblIsLock.SelectedValue);

            if (bll.Update(model))
            {
                AddAdminLog(QJEnums.ActionEnum.Edit.ToString(), "修改在线客服分组：" + model.title); //记录日志
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
                ChkAdminLevel("tools_server", QJEnums.ActionEnum.Edit.ToString()); //检查权限
                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("编辑成功！", "serv_group_list.aspx", "Success");
            }
            else //添加
            {
                ChkAdminLevel("tools_server", QJEnums.ActionEnum.Add.ToString()); //检查权限
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("添加成功！", "serv_group_list.aspx", "Success");
            }
        }
    }
}