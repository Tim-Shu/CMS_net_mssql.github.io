﻿using System;
using System.IO;
using System.Data;
using System.Xml;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QJcms.Common;

namespace QJcms.Web.admin.settings
{
    public partial class url_rewrite_list : Web.UI.ManagePage
    {
        protected string channel = string.Empty;
        protected string type = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.channel = QJRequest.GetQueryString("channel");
            this.type = QJRequest.GetQueryString("type");

            if (!Page.IsPostBack)
            {
                ChkAdminLevel("site_url_rewrite", QJEnums.ActionEnum.View.ToString()); //检查权限
                TreeBind();
                RptBind(this.channel, this.type);
            }
        }

        #region 绑定频道=================================
        private void TreeBind()
        {
            BLL.channel bll = new BLL.channel();
            DataTable dt = bll.GetList(0, "", "sort_id asc,id desc").Tables[0];

            this.ddlChannel.Items.Clear();
            this.ddlChannel.Items.Add(new ListItem("所有频道", ""));
            foreach (DataRow dr in dt.Rows)
            {
                this.ddlChannel.Items.Add(new ListItem(dr["title"].ToString(), dr["name"].ToString()));
            }
        }
        #endregion

        #region 绑定数据=================================
        private void RptBind(string _channel, string _type)
        {
            if (this.channel != "")
            {
                ddlChannel.SelectedValue = this.channel;
            }
            if (this.type != "")
            {
                ddlPageType.SelectedValue = this.type;
            }
            rptList.DataSource = new BLL.url_rewrite().GetList(_channel, _type);
            rptList.DataBind();
        }
        #endregion

        //筛选频道
        protected void ddlChannel_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("url_rewrite_list.aspx", "channel={0}&type={1}", ddlChannel.SelectedValue, this.type));
        }

        //筛选页面类型
        protected void ddlPageType_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("url_rewrite_list.aspx", "channel={0}&type={1}", this.channel, ddlPageType.SelectedValue));
        }

        //删除操作
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ChkAdminLevel("site_url_rewrite", QJEnums.ActionEnum.Delete.ToString()); //检查权限
            BLL.url_rewrite bll = new BLL.url_rewrite();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                string urlName = ((HiddenField)rptList.Items[i].FindControl("hideName")).Value;
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    bll.Remove("name", urlName);
                }
            }
            AddAdminLog(QJEnums.ActionEnum.Delete.ToString(), "删除URL配置信息"); //记录日志
            JscriptMsg("URL配置删除成功！", "url_rewrite_list.aspx", "Success");
        }

    }
}