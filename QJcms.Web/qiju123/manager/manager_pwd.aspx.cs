﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QJcms.Common;

namespace QJcms.Web.admin.manager
{
    public partial class manager_pwd : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Model.manager model = GetAdminInfo();
                ShowInfo(model.id);
            }
        }

        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.manager bll = new BLL.manager();
            Model.manager model = bll.GetModel(_id);
            txtUserName.Text = model.user_name;
            txtRealName.Text = model.real_name;
            txtTelephone.Text = model.telephone;
            txtEmail.Text = model.email;
        }
        #endregion

        //保存
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            BLL.manager bll = new BLL.manager();
            Model.manager model = GetAdminInfo();

            if (DESEncrypt.Encrypt(txtOldPassword.Text.Trim(), model.salt) != model.password)
            {
                JscriptMsg("旧密码不正确！", "", "Warning");
                return;
            }
            if (txtPassword.Text.Trim() != txtPassword1.Text.Trim())
            {
                JscriptMsg("两次密码不一致！", "", "Warning");
                return;
            }
            model.password = DESEncrypt.Encrypt(txtPassword.Text.Trim(), model.salt);
            model.real_name = txtRealName.Text.Trim();
            model.telephone = txtTelephone.Text.Trim();
            model.email = txtEmail.Text.Trim();

            if (!bll.Update(model))
            {
                JscriptMsg("保存过程中发生错误！", "", "Error");
                return;
            }
            Session[QJConst.SESSION_ADMIN_INFO] = null;
            JscriptMsg("密码修改成功！", "manager_pwd.aspx", "Success");
        }
    }
}