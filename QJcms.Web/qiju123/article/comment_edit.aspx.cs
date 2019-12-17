﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QJcms.Common;

namespace QJcms.Web.admin.article
{
    public partial class comment_edit : Web.UI.ManagePage
    {
        private int id = 0;
        private string channel_name = string.Empty; //频道名称
        protected Model.article_comment model = new Model.article_comment();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.id = QJRequest.GetQueryInt("id");
            if (id == 0)
            {
                JscriptMsg("传输参数不正确！", "back", "Error");
                return;
            }
            if (!new BLL.article_comment().Exists(this.id))
            {
                JscriptMsg("记录不存在或已删除！", "back", "Error");
                return;
            }
            if (!Page.IsPostBack)
            {
                ShowInfo(this.id);
            }
        }

        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.article_comment bll = new BLL.article_comment();
            model = bll.GetModel(_id);
            txtReContent.Text = Utils.ToTxt(model.reply_content);
            rblIsLock.SelectedValue = model.is_lock.ToString();
            this.channel_name = new BLL.channel().GetChannelName(model.channel_id); //取得频道名称
        }
        #endregion

        //保存
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ChkAdminLevel("channel_" + this.channel_name + "_comment", QJEnums.ActionEnum.Reply.ToString()); //检查权限
            BLL.article_comment bll = new BLL.article_comment();
            model = bll.GetModel(this.id);
            if (txtReContent.Text.Trim().Length > 0)
            {
                model.is_reply = 1;
                model.reply_content = Utils.ToHtml(txtReContent.Text);
                model.reply_time = DateTime.Now;
            }
            model.is_lock = int.Parse(rblIsLock.SelectedValue);
            bll.Update(model);
            AddAdminLog(QJEnums.ActionEnum.Reply.ToString(), "回复" + this.channel_name + "频道评论ID:" + model.id); //记录日志
            JscriptMsg("评论回复成功！", "comment_list.aspx?channel_id=" + model.channel_id, "Success");
        }
    }
}