﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace QJcms.Web.UI
{
    public partial class BasePage : System.Web.UI.Page
    {
        /// <summary>
        /// 评论数据总数
        /// </summary>
        /// <param name="article_id">主表ID</param>
        /// <param name="strwhere">查询条件</param>
        /// <returns>Int</returns>
        protected int get_comment_count(int article_id, string strwhere)
        {
            int count = 0;
            if (article_id > 0)
            {
                string _where = string.Format("article_id={0}", article_id);
                if (!string.IsNullOrEmpty(strwhere))
                {
                    _where += " and " + strwhere;
                }
                count = new BLL.article_comment().GetCount(_where);
            }
            return count;
        }

        /// <summary>
        /// 获取评论内容
        /// </summary>
        /// <param name="comment_id"></param>
        /// <returns></returns>
        protected string get_comment_content(int _id)
        {
            Model.article_comment model = get_comment_model(_id);

            if (model != null)
            {
                return model.content;
            }
            return "评论不存在或已被删除";
        }

        /// <summary>
        /// 获取评论实体
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        protected Model.article_comment get_comment_model(int _id)
        {
            return new BLL.article_comment().GetModel(_id);            
        }

        /// <summary>
        /// 评论列表
        /// </summary>
        /// <param name="article_id">主表ID</param>
        /// <param name="top">显示条数</param>
        /// <param name="strwhere">查询条件</param>
        /// <returns>DateTable</returns>
        protected DataTable get_comment_list(int article_id, int top, string strwhere)
        {
            DataTable dt = new DataTable();
            if (article_id > 0)
            {
                string _where = string.Format("article_id={0}", article_id);
                if (!string.IsNullOrEmpty(strwhere))
                {
                    _where += " and " + strwhere;
                }
                dt = new BLL.article_comment().GetList(top, _where, "add_time desc").Tables[0];
            }
            return dt;
        }

        /// <summary>
        /// 评论分页列表
        /// </summary>
        /// <param name="article_id">主表ID</param>
        /// <param name="page_size">页面大小</param>
        /// <param name="page_index">当前页码</param>
        /// <param name="strwhere">查询条件</param>
        /// <param name="totalcount">总记录数</param>
        /// <returns>DateTable</returns>
        protected DataTable get_comment_list(int article_id, int page_size, int page_index, string strwhere, out int totalcount)
        {
            DataTable dt = new DataTable();
            if (article_id > 0)
            {
                string _where = string.Format("article_id={0}", article_id);
                if (!string.IsNullOrEmpty(strwhere))
                {
                    _where += " and " + strwhere;
                }
                dt = new BLL.article_comment().GetList(page_size, page_index, _where, "add_time desc", out totalcount).Tables[0];
            }
            else
            {
                totalcount = 0;
            }
            return dt;
        }
    }
}
