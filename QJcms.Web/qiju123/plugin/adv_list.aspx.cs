﻿using System;
using System.Text;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using QJcms.Common;

namespace QJcms.Web.admin.plugin
{
    public partial class adv_list : Web.UI.ManagePage
    {
        protected int totalCount;
        protected int page;
        protected int pageSize;

        protected string keywords = string.Empty;
        protected string property = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.keywords = QJRequest.GetQueryString("keywords");
            this.property = QJRequest.GetQueryString("property");
            this.pageSize = GetPageSize(10); //每页数量
            BindPower();
            if (!Page.IsPostBack)
            {
                ChkAdminLevel("tools_advert_bar", QJEnums.ActionEnum.View.ToString()); //检查权限
                RptBind("id>0" + CombSqlTxt(this.keywords, this.property), "add_time desc");
            }
        }

        private void BindPower()
        {
            //添加删除权限
            Model.manager rolemodel = GetAdminInfo();
            BLL.manager_role rolebll = new BLL.manager_role();
            bool result = rolebll.Exists(rolemodel.role_id, "tools_advert_bar", QJEnums.ActionEnum.Add.ToString());
            if (!result)
            {
                tool_add.Visible = false;
            }
            result = rolebll.Exists(rolemodel.role_id, "tools_advert_bar", QJEnums.ActionEnum.Delete.ToString());
            if (!result)
            {
                tool_del.Visible = false;
            }
        }

        #region 数据绑定=================================
        private void RptBind(string _strWhere, string _orderby)
        {
            this.page = QJRequest.GetQueryInt("page", 1);
            this.txtKeywords.Text = this.keywords;
            this.ddlProperty.SelectedValue = this.property;
            BLL.advert bll = new BLL.advert();
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();
            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("adv_list.aspx", "keywords={0}&property={1}&page={2}", this.keywords, this.property, "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }
        #endregion

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(string _keywords, string _property)
        {
            StringBuilder strTemp = new StringBuilder();
            _keywords = _keywords.Replace("'", "");
            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append(" and title like '%" + _keywords + "%'");
            }
            if (!string.IsNullOrEmpty(_property))
            {
                strTemp.Append(" and type=" + _property);
            }
            return strTemp.ToString();
        }
        #endregion

        #region 返回每页数量=============================
        private int GetPageSize(int _default_size)
        {
            int _pagesize;
            if (int.TryParse(Utils.GetCookie("advert_page_size"), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    return _pagesize;
                }
            }
            return _default_size;
        }
        #endregion

        #region 显示广告类型=============================
        protected string GetTypeName(string typeId)
        {
            switch (typeId)
            {
                case "1":
                    return "文字";
                case "2":
                    return "图片";
                case "3":
                    return "幻灯片";
                case "4":
                    return "动画";
                case "5":
                    return "视频";
                case "6":
                    return "代码";
                default:
                    return "其它";
            }
        }
        #endregion

        //设置分页数量
        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {
            int _pagesize;
            if (int.TryParse(txtPageNum.Text.Trim(), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    Utils.WriteCookie("advert_page_size", _pagesize.ToString(), 14400);
                }
            }
            Response.Redirect(Utils.CombUrlTxt("adv_list.aspx", "keywords={0}", this.keywords));
        }

        //关健字查询
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("adv_list.aspx", "keywords={0}&property={1}", txtKeywords.Text, this.property));
        }

        //筛选类型
        protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("adv_list.aspx", "keywords={0}&property={1}", this.keywords, ddlProperty.SelectedValue));
        }

        //批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ChkAdminLevel("tools_advert_bar", QJEnums.ActionEnum.Delete.ToString()); //检查权限
            int sucCount = 0;
            int errorCount = 0;
            BLL.advert bll = new BLL.advert();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    if (bll.Delete(id))
                    {
                        sucCount++;
                    }
                    else
                    {
                        errorCount++;
                    }
                }
            }
            AddAdminLog(QJEnums.ActionEnum.Delete.ToString(), "删除广告位成功" + sucCount + "条，失败" + errorCount + "条"); //记录日志
            JscriptMsg("删除成功" + sucCount + "条，失败" + errorCount + "条！", 
                Utils.CombUrlTxt("adv_list.aspx", "keywords={0}&&property={1}", this.keywords, this.property), "Success");
        }

    }
}