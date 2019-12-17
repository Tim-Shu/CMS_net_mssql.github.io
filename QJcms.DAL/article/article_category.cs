﻿using QJcms.Common;
using QJcms.DBUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Text;

namespace QJcms.DAL
{
    /// <summary>
    /// 数据访问类:内容类别
    /// </summary>
    public partial class article_category
    {
        private string databaseprefix; //数据库表名前缀
        public article_category(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }

        #region 基本方法========================================
        /// <summary>
        /// 得到最大ID
        /// </summary>
        private int GetMaxId(SqlConnection conn, SqlTransaction trans)
        {
            string strSql = "select top 1 id from " + databaseprefix + "article_category order by id desc";
            object obj = DbHelperSQL.GetSingle(conn, trans, strSql);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return int.Parse(obj.ToString());
            }
        }
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "article_category");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string call_index)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "article_category");
            strSql.Append(" where call_index=@call_index");
            SqlParameter[] parameters = {
					new SqlParameter("@call_index", SqlDbType.NVarChar,50)};
            parameters[0].Value = call_index;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 返回类别名称
        /// </summary>
        public string GetTitle(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 title from " + databaseprefix + "article_category");
            strSql.Append(" where id=" + id);
            string title = Convert.ToString(DbHelperSQL.GetSingle(strSql.ToString()));
            if (string.IsNullOrEmpty(title))
            {
                return "";
            }
            return title;
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.article_category model)
        {
            using (SqlConnection conn = new SqlConnection(DbHelperSQL.connectionString))
            {
                conn.Open();
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    try
                    {
                        StringBuilder strSql = new StringBuilder();
                        strSql.Append("insert into " + databaseprefix + "article_category(");
                        strSql.Append("channel_id,title,sub_title,call_index,parent_id,class_list,class_layer,sort_id,link_url,img_url,content,seo_title,seo_keywords,seo_description,is_parent,is_sys,is_hot)");
                        strSql.Append(" values (");
                        strSql.Append("@channel_id,@title,@sub_title,@call_index,@parent_id,@class_list,@class_layer,@sort_id,@link_url,@img_url,@content,@seo_title,@seo_keywords,@seo_description,@is_parent,@is_sys,@is_hot)");
                        
                        SqlParameter[] parameters = {
					            new SqlParameter("@channel_id", SqlDbType.Int,4),
					            new SqlParameter("@title", SqlDbType.NVarChar,100),
					            new SqlParameter("@sub_title", SqlDbType.NVarChar,255),
                                new SqlParameter("@call_index", SqlDbType.NVarChar,50),
					            new SqlParameter("@parent_id", SqlDbType.Int,4),
					            new SqlParameter("@class_list", SqlDbType.NVarChar,500),
					            new SqlParameter("@class_layer", SqlDbType.Int,4),
					            new SqlParameter("@sort_id", SqlDbType.Int,4),
					            new SqlParameter("@link_url", SqlDbType.NVarChar,255),
					            new SqlParameter("@img_url", SqlDbType.NVarChar,255),
					            new SqlParameter("@content", SqlDbType.NVarChar),
					            new SqlParameter("@seo_title", SqlDbType.NVarChar,255),
					            new SqlParameter("@seo_keywords", SqlDbType.NVarChar,255),
					            new SqlParameter("@seo_description", SqlDbType.NVarChar,255),
					            new SqlParameter("@is_parent", SqlDbType.Int,4),
					            new SqlParameter("@is_sys", SqlDbType.Int,4),
					            new SqlParameter("@is_hot", SqlDbType.Int,4)};
                        parameters[0].Value = model.channel_id;
                        parameters[1].Value = model.title;
                        parameters[2].Value = model.sub_title;
                        parameters[3].Value = model.call_index;
                        parameters[4].Value = model.parent_id;
                        parameters[5].Value = model.class_list;
                        parameters[6].Value = model.class_layer;
                        parameters[7].Value = model.sort_id;
                        parameters[8].Value = model.link_url;
                        parameters[9].Value = model.img_url;
                        parameters[10].Value = model.content;
                        parameters[11].Value = model.seo_title;
                        parameters[12].Value = model.seo_keywords;
                        parameters[13].Value = model.seo_description;
                        parameters[14].Value = model.is_parent;
                        parameters[15].Value = model.is_sys;
                        parameters[16].Value = model.is_hot;

                        DbHelperSQL.ExecuteSql(conn, trans, strSql.ToString(), parameters);
                        //取得新插入的ID
                        model.id = GetMaxId(conn, trans);

                        //添加自定义图片尺寸
                        if (model.imagesize_values != null)
                        {
                            StringBuilder strSqlimage;
                            foreach (Model.article_images_size modelimagesize in model.imagesize_values)
                            {
                                strSqlimage = new StringBuilder();
                                strSqlimage.Append("insert into " + databaseprefix + "article_images_size(");
                                strSqlimage.Append("category_id,height,width)");
                                strSqlimage.Append(" values (");
                                strSqlimage.Append("@category_id,@height,@width)");

                                SqlParameter[] parametersimages = {
					                new SqlParameter("@category_id", SqlDbType.Int,4),
					                new SqlParameter("@height", SqlDbType.NVarChar,50),
					                new SqlParameter("@width", SqlDbType.NVarChar,50)};
                                parametersimages[0].Value = model.id;
                                parametersimages[1].Value = modelimagesize.height;
                                parametersimages[2].Value = modelimagesize.width;
                                DbHelperSQL.ExecuteSql(conn, trans, strSqlimage.ToString(), parametersimages);
                            }
                        }

                        //图片相册
                        if (model.albums != null)
                        {
                            Model.channel channelModel = new channel(databaseprefix).GetModel(model.channel_id);
                            if (channelModel.is_category_img == 2)
                            {
                                StringBuilder strSqlalbums;
                                foreach (Model.article_category_albums modelt in model.albums)
                                {
                                    strSqlalbums = new StringBuilder();
                                    strSqlalbums.Append("insert into " + databaseprefix + "article_category_albums(");
                                    strSqlalbums.Append("category_id,thumb_path,original_path,remark)");
                                    strSqlalbums.Append(" values (");
                                    strSqlalbums.Append("@category_id,@thumb_path,@original_path,@remark)");
                                    SqlParameter[] parametersalbums = {
					                new SqlParameter("@category_id", SqlDbType.Int,4),
					                new SqlParameter("@thumb_path", SqlDbType.NVarChar,255),
					                new SqlParameter("@original_path", SqlDbType.NVarChar,255),
					                new SqlParameter("@remark", SqlDbType.NVarChar,500)};
                                    parametersalbums[0].Value = model.id;
                                    parametersalbums[1].Value = modelt.thumb_path;
                                    parametersalbums[2].Value = modelt.original_path;
                                    parametersalbums[3].Value = modelt.remark;
                                    DbHelperSQL.ExecuteSql(conn, trans, strSqlalbums.ToString(), parametersalbums);
                                }
                            }
                        }

                        if (model.parent_id > 0)
                        {
                            Model.article_category model2 = GetModel(conn, trans, model.parent_id); //带事务
                            model.class_list = model2.class_list + model.id + ",";
                            model.class_layer = model2.class_layer + 1;
                            //修改父节点is_parent值
                            DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set is_parent=1 where id=" + model.parent_id); //带事务
                        }
                        else
                        {
                            model.class_list = "," + model.id + ",";
                            model.class_layer = 1;
                        }
                        //修改节点列表和深度
                        DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set class_list='" + model.class_list + "', class_layer=" + model.class_layer + " where id=" + model.id); //带事务
                        trans.Commit();
                    }
                    catch
                    {
                        trans.Rollback();
                        return 0;
                    }
                }
            }
            return model.id;
        }

        /// <summary>
        /// 修改一列数据
        /// </summary>
        public void UpdateField(int id, string strValue)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "article_category set " + strValue);
            strSql.Append(" where id=" + id);
            DbHelperSQL.ExecuteSql(strSql.ToString());
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.article_category model)
        {
            using (SqlConnection conn = new SqlConnection(DbHelperSQL.connectionString))
            {
                conn.Open();
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    try
                    {
                        //旧数据
                        Model.article_category oldModel = GetModel(model.id);
                        //先判断选中的父节点是否被包含
                        if (IsContainNode(model.id, model.parent_id))
                        {
                            //查找旧父节点数据
                            string class_list = "," + model.parent_id + ",";
                            int class_layer = 1;
                            if (oldModel.parent_id > 0)
                            {
                                Model.article_category oldParentModel = GetModel(conn, trans, oldModel.parent_id); //带事务
                                class_list = oldParentModel.class_list + model.parent_id + ",";
                                class_layer = oldParentModel.class_layer + 1;
                            }
                            //先提升选中的父节点
                            DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set parent_id=" + oldModel.parent_id + ",class_list='" + class_list + "', class_layer=" + class_layer + " where id=" + model.parent_id); //带事务
                            UpdateChilds(conn, trans, model.parent_id); //带事务
                        }
                        //更新子节点
                        if (model.parent_id > 0)
                        {
                            Model.article_category model2 = GetModel(conn, trans, model.parent_id); //带事务
                            model.class_list = model2.class_list + model.id + ",";
                            model.class_layer = model2.class_layer + 1;
                        }
                        else
                        {
                            model.class_list = "," + model.id + ",";
                            model.class_layer = 1;
                        }

                        StringBuilder strSql = new StringBuilder();
                        strSql.Append("update " + databaseprefix + "article_category set ");
                        strSql.Append("channel_id=@channel_id,");
                        strSql.Append("title=@title,");
                        strSql.Append("sub_title=@sub_title,");
                        strSql.Append("call_index=@call_index,");
                        strSql.Append("parent_id=@parent_id,");
                        strSql.Append("class_list=@class_list,");
                        strSql.Append("class_layer=@class_layer,");
                        strSql.Append("sort_id=@sort_id,");
                        strSql.Append("link_url=@link_url,");
                        strSql.Append("img_url=@img_url,");
                        strSql.Append("content=@content,");
                        strSql.Append("seo_title=@seo_title,");
                        strSql.Append("seo_keywords=@seo_keywords,");
                        strSql.Append("seo_description=@seo_description,");
                        strSql.Append("is_sys=@is_sys,");
                        strSql.Append("is_hot=@is_hot");
                        strSql.Append(" where id=@id");
                        SqlParameter[] parameters = {
					            new SqlParameter("@channel_id", SqlDbType.Int,4),
					            new SqlParameter("@title", SqlDbType.NVarChar,100),
					            new SqlParameter("@sub_title", SqlDbType.NVarChar,255),
                                new SqlParameter("@call_index", SqlDbType.NVarChar,50),
					            new SqlParameter("@parent_id", SqlDbType.Int,4),
					            new SqlParameter("@class_list", SqlDbType.NVarChar,500),
					            new SqlParameter("@class_layer", SqlDbType.Int,4),
					            new SqlParameter("@sort_id", SqlDbType.Int,4),
					            new SqlParameter("@link_url", SqlDbType.NVarChar,255),
					            new SqlParameter("@img_url", SqlDbType.NVarChar,255),
					            new SqlParameter("@content", SqlDbType.NVarChar),
					            new SqlParameter("@seo_title", SqlDbType.NVarChar,255),
					            new SqlParameter("@seo_keywords", SqlDbType.NVarChar,255),
					            new SqlParameter("@seo_description", SqlDbType.NVarChar,255),
					            new SqlParameter("@is_sys", SqlDbType.Int,4),
					            new SqlParameter("@is_hot", SqlDbType.Int,4),
					            new SqlParameter("@id", SqlDbType.Int,4)};
                        parameters[0].Value = model.channel_id;
                        parameters[1].Value = model.title;
                        parameters[2].Value = model.sub_title;
                        parameters[3].Value = model.call_index;
                        parameters[4].Value = model.parent_id;
                        parameters[5].Value = model.class_list;
                        parameters[6].Value = model.class_layer;
                        parameters[7].Value = model.sort_id;
                        parameters[8].Value = model.link_url;
                        parameters[9].Value = model.img_url;
                        parameters[10].Value = model.content;
                        parameters[11].Value = model.seo_title;
                        parameters[12].Value = model.seo_keywords;
                        parameters[13].Value = model.seo_description;
                        parameters[14].Value = model.is_sys;
                        parameters[15].Value = model.is_hot;
                        parameters[16].Value = model.id;
                        DbHelperSQL.ExecuteSql(conn, trans, strSql.ToString(), parameters);


                        //添加自定义图片尺寸
                        if (model.imagesize_values != null)
                        {
                            //删除已删除的图片
                            new article_images_size(databaseprefix).DeleteList(conn, trans, model.imagesize_values, model.id);
                            StringBuilder strSqlimage;
                            foreach (Model.article_images_size modelimagesize in model.imagesize_values)
                            {
                                strSqlimage = new StringBuilder();
                                if (modelimagesize.id > 0)
                                {
                                    strSqlimage.Append("update " + databaseprefix + "article_images_size set ");
                                    strSqlimage.Append("category_id=@category_id,");
                                    strSqlimage.Append("height=@height,");
                                    strSqlimage.Append("width=@width");
                                    strSqlimage.Append(" where id=@id");
                                    SqlParameter[] parametersimages = {
					                new SqlParameter("@category_id", SqlDbType.Int,4),
					                new SqlParameter("@height", SqlDbType.NVarChar,50),
					                new SqlParameter("@width", SqlDbType.NVarChar,50),
					                new SqlParameter("@id", SqlDbType.Int,4)};
                                    parametersimages[0].Value = model.id;
                                    parametersimages[1].Value = modelimagesize.height;
                                    parametersimages[2].Value = modelimagesize.width;
                                    parametersimages[3].Value = model.id;
                                    DbHelperSQL.ExecuteSql(conn, trans, strSqlimage.ToString(), parametersimages);
                                }
                                else
                                {
                                    strSqlimage.Append("insert into " + databaseprefix + "article_images_size(");
                                    strSqlimage.Append("category_id,height,width)");
                                    strSqlimage.Append(" values (");
                                    strSqlimage.Append("@category_id,@height,@width)");
                                    SqlParameter[] parametersimages = {
					                new SqlParameter("@category_id", SqlDbType.Int,4),
					                new SqlParameter("@height", SqlDbType.NVarChar,50),
					                new SqlParameter("@width", SqlDbType.NVarChar,50)};
                                    parametersimages[0].Value = model.id;
                                    parametersimages[1].Value = modelimagesize.height;
                                    parametersimages[2].Value = modelimagesize.width;
                                    DbHelperSQL.ExecuteSql(conn, trans, strSqlimage.ToString(), parametersimages);
                                }
                            }
                        }

                        //添加/修改相册
                        if (model.albums.Count > 0)
                        {
                            Model.channel channelModel = new channel(databaseprefix).GetModel(model.channel_id);
                            if (channelModel.is_category_img == 2)
                            {
                                StringBuilder strSqlalbums;
                                foreach (Model.article_category_albums modelt in model.albums)
                                {
                                    strSqlalbums = new StringBuilder();
                                    if (modelt.id > 0)
                                    {
                                        strSqlalbums.Append("update " + databaseprefix + "article_category_albums set ");
                                        strSqlalbums.Append("category_id=@category_id,");
                                        strSqlalbums.Append("thumb_path=@thumb_path,");
                                        strSqlalbums.Append("original_path=@original_path,");
                                        strSqlalbums.Append("remark=@remark");
                                        strSqlalbums.Append(" where id=@id");
                                        SqlParameter[] parametersalbums = {
					                        new SqlParameter("@category_id", SqlDbType.Int,4),
					                        new SqlParameter("@thumb_path", SqlDbType.NVarChar,255),
					                        new SqlParameter("@original_path", SqlDbType.NVarChar,255),
					                        new SqlParameter("@remark", SqlDbType.NVarChar,500),
                                            new SqlParameter("@id", SqlDbType.Int,4)};
                                        parametersalbums[0].Value = modelt.category_id;
                                        parametersalbums[1].Value = modelt.thumb_path;
                                        parametersalbums[2].Value = modelt.original_path;
                                        parametersalbums[3].Value = modelt.remark;
                                        parametersalbums[4].Value = modelt.id;
                                        DbHelperSQL.ExecuteSql(conn, trans, strSqlalbums.ToString(), parametersalbums);
                                    }
                                    else
                                    {
                                        strSqlalbums.Append("insert into " + databaseprefix + "article_category_albums(");
                                        strSqlalbums.Append("category_id,thumb_path,original_path,remark)");
                                        strSqlalbums.Append(" values (");
                                        strSqlalbums.Append("@category_id,@thumb_path,@original_path,@remark)");
                                        SqlParameter[] parametersalbums = {
					                        new SqlParameter("@category_id", SqlDbType.Int,4),
					                        new SqlParameter("@thumb_path", SqlDbType.NVarChar,255),
					                        new SqlParameter("@original_path", SqlDbType.NVarChar,255),
					                        new SqlParameter("@remark", SqlDbType.NVarChar,500)};
                                        parametersalbums[0].Value = modelt.category_id;
                                        parametersalbums[1].Value = modelt.thumb_path;
                                        parametersalbums[2].Value = modelt.original_path;
                                        parametersalbums[3].Value = modelt.remark;
                                        DbHelperSQL.ExecuteSql(conn, trans, strSqlalbums.ToString(), parametersalbums);
                                    }
                                }
                            }
                            else { bool clearAlbums = new article_category_albums(databaseprefix).ClearFile(model.id); }
                        }
                        //更新是否含子节点
                        //更新自身 UpdateChilds 方法中更改
                        //更新原父节点
                        if (oldModel.parent_id > 0 && oldModel.parent_id != model.parent_id)
                        {
                            string strSqlParent = "select id from " + databaseprefix + "article_category where parent_id=" + oldModel.parent_id;
                            DataSet ds = DbHelperSQL.Query(conn, trans, strSqlParent); //带事务    
                            //更新自身是否包含子节点
                            if (ds.Tables[0].Rows.Count > 0) //包含子节点
                            {
                                DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set is_parent=1 where id=" + oldModel.parent_id); //带事务
                            }
                            else  //无子节点
                            {
                                DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set is_parent=0 where id=" + oldModel.parent_id); //带事务
                            }
                        }
                        //更新现父节点
                        if (model.parent_id > 0)
                        {
                            DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set is_parent=1 where id=" + model.parent_id); //带事务
                        }
                        //更新子节点
                        UpdateChilds(conn, trans, model.id);
                        trans.Commit();
                        //删除已删除的图片
                        new article_category_albums(databaseprefix).DeleteList(conn, trans, model.albums, model.id);
                    }
                    catch (Exception ex)
                    {
                        trans.Rollback();
                        return false;
                    }
                }
            }
            return true;
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from " + databaseprefix + "article_category ");
            strSql.Append(" where class_list like '%," + id + ",%' ");
            DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.article_category GetModel(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,channel_id,title,sub_title,call_index,parent_id,class_list,class_layer,sort_id,link_url,img_url,content,seo_title,seo_keywords,seo_description,is_parent,is_sys,is_hot from " + databaseprefix + "article_category ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            Model.article_category model = new Model.article_category();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["id"] != null && ds.Tables[0].Rows[0]["id"].ToString() != "")
                {
                    model.id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["channel_id"] != null && ds.Tables[0].Rows[0]["channel_id"].ToString() != "")
                {
                    model.channel_id = int.Parse(ds.Tables[0].Rows[0]["channel_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["title"] != null && ds.Tables[0].Rows[0]["title"].ToString() != "")
                {
                    model.title = ds.Tables[0].Rows[0]["title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["sub_title"] != null && ds.Tables[0].Rows[0]["sub_title"].ToString() != "")
                {
                    model.sub_title = ds.Tables[0].Rows[0]["sub_title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["call_index"] != null && ds.Tables[0].Rows[0]["call_index"].ToString() != "")
                {
                    model.call_index = ds.Tables[0].Rows[0]["call_index"].ToString();
                }
                if (ds.Tables[0].Rows[0]["parent_id"] != null && ds.Tables[0].Rows[0]["parent_id"].ToString() != "")
                {
                    model.parent_id = int.Parse(ds.Tables[0].Rows[0]["parent_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["class_list"] != null && ds.Tables[0].Rows[0]["class_list"].ToString() != "")
                {
                    model.class_list = ds.Tables[0].Rows[0]["class_list"].ToString();
                }
                if (ds.Tables[0].Rows[0]["class_layer"] != null && ds.Tables[0].Rows[0]["class_layer"].ToString() != "")
                {
                    model.class_layer = int.Parse(ds.Tables[0].Rows[0]["class_layer"].ToString());
                }
                if (ds.Tables[0].Rows[0]["sort_id"] != null && ds.Tables[0].Rows[0]["sort_id"].ToString() != "")
                {
                    model.sort_id = int.Parse(ds.Tables[0].Rows[0]["sort_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["link_url"] != null && ds.Tables[0].Rows[0]["link_url"].ToString() != "")
                {
                    model.link_url = ds.Tables[0].Rows[0]["link_url"].ToString();
                }
                if (ds.Tables[0].Rows[0]["img_url"] != null && ds.Tables[0].Rows[0]["img_url"].ToString() != "")
                {
                    model.img_url = ds.Tables[0].Rows[0]["img_url"].ToString();
                }
                if (ds.Tables[0].Rows[0]["content"] != null && ds.Tables[0].Rows[0]["content"].ToString() != "")
                {
                    model.content = ds.Tables[0].Rows[0]["content"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_title"] != null && ds.Tables[0].Rows[0]["seo_title"].ToString() != "")
                {
                    model.seo_title = ds.Tables[0].Rows[0]["seo_title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_keywords"] != null && ds.Tables[0].Rows[0]["seo_keywords"].ToString() != "")
                {
                    model.seo_keywords = ds.Tables[0].Rows[0]["seo_keywords"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_description"] != null && ds.Tables[0].Rows[0]["seo_description"].ToString() != "")
                {
                    model.seo_description = ds.Tables[0].Rows[0]["seo_description"].ToString();
                }
                if (ds.Tables[0].Rows[0]["is_parent"] != null && ds.Tables[0].Rows[0]["is_parent"].ToString() != "")
                {
                    model.is_parent = int.Parse(ds.Tables[0].Rows[0]["is_parent"].ToString());
                }
                if (ds.Tables[0].Rows[0]["is_sys"] != null && ds.Tables[0].Rows[0]["is_sys"].ToString() != "")
                {
                    model.is_sys = int.Parse(ds.Tables[0].Rows[0]["is_sys"].ToString());
                }
                if (ds.Tables[0].Rows[0]["is_hot"] != null && ds.Tables[0].Rows[0]["is_hot"].ToString() != "")
                {
                    model.is_hot = int.Parse(ds.Tables[0].Rows[0]["is_hot"].ToString());
                }
                //相册信息
                model.albums = new article_category_albums(databaseprefix).GetList(id);
                return model;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.article_category GetModel(string call_index)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,channel_id,title,sub_title,call_index,parent_id,class_list,class_layer,sort_id,link_url,img_url,content,seo_title,seo_keywords,seo_description,is_parent,is_sys,is_hot from " + databaseprefix + "article_category ");
            strSql.Append(" where call_index=@call_index");
            SqlParameter[] parameters = {
					new SqlParameter("@call_index", SqlDbType.NVarChar,50)};
            parameters[0].Value = call_index;

            Model.article_category model = new Model.article_category();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["id"] != null && ds.Tables[0].Rows[0]["id"].ToString() != "")
                {
                    model.id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["channel_id"] != null && ds.Tables[0].Rows[0]["channel_id"].ToString() != "")
                {
                    model.channel_id = int.Parse(ds.Tables[0].Rows[0]["channel_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["title"] != null && ds.Tables[0].Rows[0]["title"].ToString() != "")
                {
                    model.title = ds.Tables[0].Rows[0]["title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["sub_title"] != null && ds.Tables[0].Rows[0]["sub_title"].ToString() != "")
                {
                    model.sub_title = ds.Tables[0].Rows[0]["sub_title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["call_index"] != null && ds.Tables[0].Rows[0]["call_index"].ToString() != "")
                {
                    model.call_index = ds.Tables[0].Rows[0]["call_index"].ToString();
                }
                if (ds.Tables[0].Rows[0]["parent_id"] != null && ds.Tables[0].Rows[0]["parent_id"].ToString() != "")
                {
                    model.parent_id = int.Parse(ds.Tables[0].Rows[0]["parent_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["class_list"] != null && ds.Tables[0].Rows[0]["class_list"].ToString() != "")
                {
                    model.class_list = ds.Tables[0].Rows[0]["class_list"].ToString();
                }
                if (ds.Tables[0].Rows[0]["class_layer"] != null && ds.Tables[0].Rows[0]["class_layer"].ToString() != "")
                {
                    model.class_layer = int.Parse(ds.Tables[0].Rows[0]["class_layer"].ToString());
                }
                if (ds.Tables[0].Rows[0]["sort_id"] != null && ds.Tables[0].Rows[0]["sort_id"].ToString() != "")
                {
                    model.sort_id = int.Parse(ds.Tables[0].Rows[0]["sort_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["link_url"] != null && ds.Tables[0].Rows[0]["link_url"].ToString() != "")
                {
                    model.link_url = ds.Tables[0].Rows[0]["link_url"].ToString();
                }
                if (ds.Tables[0].Rows[0]["img_url"] != null && ds.Tables[0].Rows[0]["img_url"].ToString() != "")
                {
                    model.img_url = ds.Tables[0].Rows[0]["img_url"].ToString();
                }
                if (ds.Tables[0].Rows[0]["content"] != null && ds.Tables[0].Rows[0]["content"].ToString() != "")
                {
                    model.content = ds.Tables[0].Rows[0]["content"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_title"] != null && ds.Tables[0].Rows[0]["seo_title"].ToString() != "")
                {
                    model.seo_title = ds.Tables[0].Rows[0]["seo_title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_keywords"] != null && ds.Tables[0].Rows[0]["seo_keywords"].ToString() != "")
                {
                    model.seo_keywords = ds.Tables[0].Rows[0]["seo_keywords"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_description"] != null && ds.Tables[0].Rows[0]["seo_description"].ToString() != "")
                {
                    model.seo_description = ds.Tables[0].Rows[0]["seo_description"].ToString();
                }
                if (ds.Tables[0].Rows[0]["is_parent"] != null && ds.Tables[0].Rows[0]["is_parent"].ToString() != "")
                {
                    model.is_parent = int.Parse(ds.Tables[0].Rows[0]["is_parent"].ToString());
                }
                if (ds.Tables[0].Rows[0]["is_sys"] != null && ds.Tables[0].Rows[0]["is_sys"].ToString() != "")
                {
                    model.is_sys = int.Parse(ds.Tables[0].Rows[0]["is_sys"].ToString());
                }
                if (ds.Tables[0].Rows[0]["is_hot"] != null && ds.Tables[0].Rows[0]["is_hot"].ToString() != "")
                {
                    model.is_hot = int.Parse(ds.Tables[0].Rows[0]["is_hot"].ToString());
                }
                //相册信息
                model.albums = new article_category_albums(databaseprefix).GetList(model.id);
                return model;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 得到一个对象实体(重载，带事务)
        /// </summary>
        public Model.article_category GetModel(SqlConnection conn, SqlTransaction trans, int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,channel_id,title,sub_title,call_index,parent_id,class_list,class_layer,sort_id,link_url,img_url,content,seo_title,seo_keywords,seo_description,is_parent,is_sys,is_hot from " + databaseprefix + "article_category ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            Model.article_category model = new Model.article_category();
            DataSet ds = DbHelperSQL.Query(conn, trans, strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["id"] != null && ds.Tables[0].Rows[0]["id"].ToString() != "")
                {
                    model.id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["channel_id"] != null && ds.Tables[0].Rows[0]["channel_id"].ToString() != "")
                {
                    model.channel_id = int.Parse(ds.Tables[0].Rows[0]["channel_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["title"] != null && ds.Tables[0].Rows[0]["title"].ToString() != "")
                {
                    model.title = ds.Tables[0].Rows[0]["title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["sub_title"] != null && ds.Tables[0].Rows[0]["sub_title"].ToString() != "")
                {
                    model.sub_title = ds.Tables[0].Rows[0]["sub_title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["call_index"] != null && ds.Tables[0].Rows[0]["call_index"].ToString() != "")
                {
                    model.call_index = ds.Tables[0].Rows[0]["call_index"].ToString();
                }
                if (ds.Tables[0].Rows[0]["parent_id"] != null && ds.Tables[0].Rows[0]["parent_id"].ToString() != "")
                {
                    model.parent_id = int.Parse(ds.Tables[0].Rows[0]["parent_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["class_list"] != null && ds.Tables[0].Rows[0]["class_list"].ToString() != "")
                {
                    model.class_list = ds.Tables[0].Rows[0]["class_list"].ToString();
                }
                if (ds.Tables[0].Rows[0]["class_layer"] != null && ds.Tables[0].Rows[0]["class_layer"].ToString() != "")
                {
                    model.class_layer = int.Parse(ds.Tables[0].Rows[0]["class_layer"].ToString());
                }
                if (ds.Tables[0].Rows[0]["sort_id"] != null && ds.Tables[0].Rows[0]["sort_id"].ToString() != "")
                {
                    model.sort_id = int.Parse(ds.Tables[0].Rows[0]["sort_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["link_url"] != null && ds.Tables[0].Rows[0]["link_url"].ToString() != "")
                {
                    model.link_url = ds.Tables[0].Rows[0]["link_url"].ToString();
                }
                if (ds.Tables[0].Rows[0]["img_url"] != null && ds.Tables[0].Rows[0]["img_url"].ToString() != "")
                {
                    model.img_url = ds.Tables[0].Rows[0]["img_url"].ToString();
                }
                if (ds.Tables[0].Rows[0]["content"] != null && ds.Tables[0].Rows[0]["content"].ToString() != "")
                {
                    model.content = ds.Tables[0].Rows[0]["content"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_title"] != null && ds.Tables[0].Rows[0]["seo_title"].ToString() != "")
                {
                    model.seo_title = ds.Tables[0].Rows[0]["seo_title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_keywords"] != null && ds.Tables[0].Rows[0]["seo_keywords"].ToString() != "")
                {
                    model.seo_keywords = ds.Tables[0].Rows[0]["seo_keywords"].ToString();
                }
                if (ds.Tables[0].Rows[0]["seo_description"] != null && ds.Tables[0].Rows[0]["seo_description"].ToString() != "")
                {
                    model.seo_description = ds.Tables[0].Rows[0]["seo_description"].ToString();
                }
                if (ds.Tables[0].Rows[0]["is_parent"] != null && ds.Tables[0].Rows[0]["is_parent"].ToString() != "")
                {
                    model.is_parent = int.Parse(ds.Tables[0].Rows[0]["is_parent"].ToString());
                }
                if (ds.Tables[0].Rows[0]["is_sys"] != null && ds.Tables[0].Rows[0]["is_sys"].ToString() != "")
                {
                    model.is_sys = int.Parse(ds.Tables[0].Rows[0]["is_sys"].ToString());
                }
                if (ds.Tables[0].Rows[0]["is_hot"] != null && ds.Tables[0].Rows[0]["is_hot"].ToString() != "")
                {
                    model.is_hot = int.Parse(ds.Tables[0].Rows[0]["is_hot"].ToString());
                }
                return model;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 取得指定类别下的列表
        /// </summary>
        /// <param name="parent_id">父ID</param>
        /// <param name="channel_id">频道ID</param>
        /// <returns></returns>
        public DataTable GetChildList(int parent_id, int channel_id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,channel_id,title,sub_title,call_index,parent_id,class_list,class_layer,sort_id,link_url,img_url,content,seo_title,seo_keywords,seo_description,is_parent,is_sys,is_hot from " + databaseprefix + "article_category");
            strSql.Append(" where channel_id=" + channel_id + " and parent_id=" + parent_id + " order by sort_id asc,id desc");
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            return ds.Tables[0];
        }

        /// <summary>
        /// 取得所有类别列表
        /// </summary>
        /// <param name="parent_id">父ID</param>
        /// <param name="channel_id">频道ID</param>
        /// <returns></returns>
        public DataTable GetList(int parent_id, int channel_id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,channel_id,title,sub_title,call_index,parent_id,class_list,class_layer,sort_id,link_url,img_url,content,seo_title,seo_keywords,seo_description,is_parent,is_sys,is_hot from " + databaseprefix + "article_category");
            strSql.Append(" where channel_id=" + channel_id + " order by sort_id asc,id desc");
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            DataTable oldData = ds.Tables[0] as DataTable;
            if (oldData == null)
            {
                return null;
            }
            //复制结构
            DataTable newData = oldData.Clone();
            //调用迭代组合成DAGATABLE
            GetChilds(oldData, newData, parent_id, channel_id);
            return newData;
        }
        /// <summary>
        /// 取得当前条件类别列表
        /// </summary>
        /// <param name="parent_id">条件</param>
        /// <param name="channel_id">频道ID</param>
        /// <returns></returns>
        public DataTable GetList(string strwhere, int channel_id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,channel_id,title,sub_title,call_index,parent_id,class_list,class_layer,sort_id,link_url,img_url,content,seo_title,seo_keywords,seo_description,is_parent,is_sys,is_hot from " + databaseprefix + "article_category");            
            strSql.Append(" where channel_id=" + channel_id + " " + strwhere + " order by sort_id asc,id desc");
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            DataTable oldData = ds.Tables[0] as DataTable;
            if (oldData == null)
            {
                return null;
            }
            return oldData;
        }

        /// <summary>
        /// 获取所有频道，所有分类
        /// </summary>
        /// <returns></returns>
        public DataTable GetAllList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,channel_id,title,sub_title,call_index,parent_id,class_list,class_layer,sort_id,link_url,img_url,content,seo_title,seo_keywords,seo_description,is_parent,is_sys,is_hot from " + databaseprefix + "article_category");
            strSql.Append(" order by sort_id asc,id desc");
            DataSet ds = DbHelperSQL.Query(strSql.ToString());

            return ds.Tables[0];
        }


        #region 扩展方法================================
        public int GetParentId(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 parent_id from " + databaseprefix + "article_category");
            strSql.Append(" where id=" + id);
            return Convert.ToInt32(DbHelperSQL.GetSingle(strSql.ToString()));
        }
        #endregion

        #region 私有方法================================
        /// <summary>
        /// 从内存中取得所有下级类别列表（自身迭代）
        /// </summary>
        private void GetChilds(DataTable oldData, DataTable newData, int parent_id, int channel_id)
        {
            DataRow[] dr = oldData.Select("parent_id=" + parent_id);
            for (int i = 0; i < dr.Length; i++)
            {
                //添加一行数据
                DataRow row = newData.NewRow();
                row["id"] = int.Parse(dr[i]["id"].ToString());
                row["channel_id"] = int.Parse(dr[i]["channel_id"].ToString());
                row["title"] = dr[i]["title"].ToString();
                row["sub_title"] = dr[i]["sub_title"].ToString();
                row["call_index"] = dr[i]["call_index"].ToString();
                row["parent_id"] = int.Parse(dr[i]["parent_id"].ToString());
                row["class_list"] = dr[i]["class_list"].ToString();
                row["class_layer"] = int.Parse(dr[i]["class_layer"].ToString());
                row["sort_id"] = int.Parse(dr[i]["sort_id"].ToString());
                row["link_url"] = dr[i]["link_url"].ToString();
                row["img_url"] = dr[i]["img_url"].ToString();
                row["content"] = dr[i]["content"].ToString();
                row["seo_title"] = dr[i]["seo_title"].ToString();
                row["seo_keywords"] = dr[i]["seo_keywords"].ToString();
                row["seo_description"] = dr[i]["seo_description"].ToString();
                row["is_parent"] = int.Parse(dr[i]["is_parent"].ToString());
                row["is_sys"] = int.Parse(dr[i]["is_sys"].ToString());
                row["is_hot"] = int.Parse(dr[i]["is_hot"].ToString());
                newData.Rows.Add(row);
                //调用自身迭代
                this.GetChilds(oldData, newData, int.Parse(dr[i]["id"].ToString()), channel_id);
            }
        }

        /// <summary>
        /// 修改子节点的ID列表及深度（自身迭代）
        /// </summary>
        /// <param name="parent_id"></param>
        private void UpdateChilds(SqlConnection conn, SqlTransaction trans, int parent_id)
        {
            //查找父节点信息
            Model.article_category model = GetModel(conn, trans, parent_id);
            if (model != null)
            {
                //查找子节点
                string strSql = "select id from " + databaseprefix + "article_category where parent_id=" + parent_id;
                DataSet ds = DbHelperSQL.Query(conn, trans, strSql); //带事务    
                //更新自身是否包含子节点
                if (ds.Tables[0].Rows.Count > 0) //包含子节点
                {
                    DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set is_parent=1 where id=" + parent_id); //带事务
                }
                else  //无子节点
                {
                    DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set is_parent=0 where id=" + parent_id); //带事务
                }
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    //修改子节点的ID列表及深度
                    int id = int.Parse(dr["id"].ToString());
                    string class_list = model.class_list + id + ",";
                    int class_layer = model.class_layer + 1;
                    DbHelperSQL.ExecuteSql(conn, trans, "update " + databaseprefix + "article_category set class_list='" + class_list + "', class_layer=" + class_layer + " where id=" + id); //带事务

                    //调用自身迭代
                    this.UpdateChilds(conn, trans, id); //带事务
                }
            }
        }

        /// <summary>
        /// 验证节点是否被包含
        /// </summary>
        /// <param name="id">待查询的节点</param>
        /// <param name="parent_id">父节点</param>
        /// <returns></returns>
        private bool IsContainNode(int id, int parent_id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "article_category ");
            strSql.Append(" where class_list like '%," + id + ",%' and id=" + parent_id);
            return DbHelperSQL.Exists(strSql.ToString());
        }

        #endregion

        #endregion
    }
}