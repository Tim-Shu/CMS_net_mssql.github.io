﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QJcms.Common;

namespace QJcms.Web.admin.plugin
{
    public partial class feedback_reply : Web.UI.ManagePage
    {
        private int id = 0;
        protected Model.feedback model = new Model.feedback();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.id = QJRequest.GetQueryInt("id");
            if (this.id == 0)
            {
                JscriptMsg("传输参数不正确！", "back", "Error");
                return;
            }
            if (!new BLL.feedback().Exists(this.id))
            {
                JscriptMsg("信息不存在或已被删除！", "back", "Error");
                return;
            }
            if (!Page.IsPostBack)
            {
                ChkAdminLevel("tools_feedback", QJEnums.ActionEnum.View.ToString()); //检查权限
                ShowInfo(this.id);
            }
        }

        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.feedback bll = new BLL.feedback();
            model = bll.GetModel(_id);
            txtReContent.Text = Utils.ToTxt(model.reply_content);
        }
        #endregion

        //保存
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ChkAdminLevel("tools_feedback", QJEnums.ActionEnum.Reply.ToString()); //检查权限
            BLL.feedback bll = new BLL.feedback();
            model = bll.GetModel(this.id);
            model.reply_content = Utils.ToHtml(txtReContent.Text);
            model.reply_time = DateTime.Now;
            bll.Update(model);
            AddAdminLog(QJEnums.ActionEnum.Reply.ToString(), "回复留言内容：" + model.title); //记录日志
            JscriptMsg("留言回复成功！", "feedback_list.aspx", "Success");
        }
    }
}