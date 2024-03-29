﻿using System;
using System.Text;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QJcms.Common;

namespace QJcms.Web.admin.settings
{
    public partial class builder_html : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ChkAdminLevel("app_builder_html", QJEnums.ActionEnum.View.ToString()); //检查权限
                RptBind();
            }
        }

        #region 数据绑定=================================
        private void RptBind()
        {
            BLL.channel_category bll = new BLL.channel_category();
            DataSet ds = bll.GetList(0, "", "sort_id asc,id desc");
            this.rptList.DataSource = ds;
            this.rptList.DataBind();
        }
        #endregion

        //嵌套绑定
        protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            BLL.channel bll = new BLL.channel();
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Repeater rptChannel = (Repeater)e.Item.FindControl("rptChannel");
                //找到分类Repeater关联的数据项 
                DataRowView drv = (DataRowView)e.Item.DataItem;
                //提取分类ID 
                int categoryId = Convert.ToInt32(drv["id"]);
                //根据分类ID查询并绑定所属频道 
                rptChannel.DataSource = bll.GetList(0, "category_id=" + categoryId, "sort_id asc,id desc");
                rptChannel.DataBind(); 
            }
        }
    }
}