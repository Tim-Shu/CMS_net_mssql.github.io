using QJcms.Common;
using QJcms.DBUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Text;

namespace QJcms.DAL
{
    /// <summary>
    /// 数据访问类:OAuth应用
    /// </summary>
    public partial class user_oauth_app
    {
        private string databaseprefix; //数据库表名前缀
        public user_oauth_app(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }

        #region  Method
        /// <summary>
        /// 得到最大ID
        /// </summary>
        private int GetMaxId(SqlConnection conn, SqlTransaction trans)
        {
            string strSql = "select top 1 id from " + databaseprefix + "user_oauth_app order by id desc";
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
            strSql.Append("select count(1) from " + databaseprefix + "user_oauth_app");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.user_oauth_app model)
        {
            int newId;
            using (SqlConnection conn = new SqlConnection(DbHelperSQL.connectionString))
            {
                conn.Open();
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    try
                    {
                        StringBuilder strSql = new StringBuilder();
                        strSql.Append("insert into " + databaseprefix + "user_oauth_app(");
                        strSql.Append("title,img_url,app_id,app_key,remark,sort_id,is_lock,api_path)");
                        strSql.Append(" values (");
                        strSql.Append("@title,@img_url,@app_id,@app_key,@remark,@sort_id,@is_lock,@api_path)");

                        SqlParameter[] parameters = {
					        new SqlParameter("@title", SqlDbType.NVarChar,100),
					        new SqlParameter("@img_url", SqlDbType.NVarChar,255),
					        new SqlParameter("@app_id", SqlDbType.NVarChar,100),
					        new SqlParameter("@app_key", SqlDbType.NVarChar,500),
					        new SqlParameter("@remark", SqlDbType.NVarChar,500),
					        new SqlParameter("@sort_id", SqlDbType.Int,4),
					        new SqlParameter("@is_lock", SqlDbType.Int,4),
					        new SqlParameter("@api_path", SqlDbType.NVarChar,100)};
                        parameters[0].Value = model.title;
                        parameters[1].Value = model.img_url;
                        parameters[2].Value = model.app_id;
                        parameters[3].Value = model.app_key;
                        parameters[4].Value = model.remark;
                        parameters[5].Value = model.sort_id;
                        parameters[6].Value = model.is_lock;
                        parameters[7].Value = model.api_path;

                        DbHelperSQL.ExecuteSql(conn, trans, strSql.ToString(), parameters);
                        //取得新插入的ID
                        newId = GetMaxId(conn, trans);
                        trans.Commit();
                    }
                    catch
                    {
                        trans.Rollback();
                        return 0;
                    }
                }
            }
            return newId;
        }

        /// <summary>
        /// 修改一列数据
        /// </summary>
        public void UpdateField(int id, string strValue)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "user_oauth_app set " + strValue);
            strSql.Append(" where id=" + id);
            DbHelperSQL.ExecuteSql(strSql.ToString());
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.user_oauth_app model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "user_oauth_app set ");
            strSql.Append("title=@title,");
            strSql.Append("img_url=@img_url,");
            strSql.Append("app_id=@app_id,");
            strSql.Append("app_key=@app_key,");
            strSql.Append("remark=@remark,");
            strSql.Append("sort_id=@sort_id,");
            strSql.Append("is_lock=@is_lock,");
            strSql.Append("api_path=@api_path");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@title", SqlDbType.NVarChar,100),
					new SqlParameter("@img_url", SqlDbType.NVarChar,255),
					new SqlParameter("@app_id", SqlDbType.NVarChar,100),
					new SqlParameter("@app_key", SqlDbType.NVarChar,100),
					new SqlParameter("@remark", SqlDbType.NVarChar,500),
					new SqlParameter("@sort_id", SqlDbType.Int,4),
					new SqlParameter("@is_lock", SqlDbType.Int,4),
					new SqlParameter("@api_path", SqlDbType.NVarChar,100),
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = model.title;
            parameters[1].Value = model.img_url;
            parameters[2].Value = model.app_id;
            parameters[3].Value = model.app_key;
            parameters[4].Value = model.remark;
            parameters[5].Value = model.sort_id;
            parameters[6].Value = model.is_lock;
            parameters[7].Value = model.api_path;
            parameters[8].Value = model.id;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from " + databaseprefix + "user_oauth_app ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.user_oauth_app GetModel(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 id,title,img_url,app_id,app_key,remark,sort_id,is_lock,api_path from " + databaseprefix + "user_oauth_app ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            Model.user_oauth_app model = new Model.user_oauth_app();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["id"] != null && ds.Tables[0].Rows[0]["id"].ToString() != "")
                {
                    model.id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["title"] != null && ds.Tables[0].Rows[0]["title"].ToString() != "")
                {
                    model.title = ds.Tables[0].Rows[0]["title"].ToString();
                }
                if (ds.Tables[0].Rows[0]["img_url"] != null && ds.Tables[0].Rows[0]["img_url"].ToString() != "")
                {
                    model.img_url = ds.Tables[0].Rows[0]["img_url"].ToString();
                }
                if (ds.Tables[0].Rows[0]["app_id"] != null && ds.Tables[0].Rows[0]["app_id"].ToString() != "")
                {
                    model.app_id = ds.Tables[0].Rows[0]["app_id"].ToString();
                }
                if (ds.Tables[0].Rows[0]["app_key"] != null && ds.Tables[0].Rows[0]["app_key"].ToString() != "")
                {
                    model.app_key = ds.Tables[0].Rows[0]["app_key"].ToString();
                }
                if (ds.Tables[0].Rows[0]["remark"] != null && ds.Tables[0].Rows[0]["remark"].ToString() != "")
                {
                    model.remark = ds.Tables[0].Rows[0]["remark"].ToString();
                }
                if (ds.Tables[0].Rows[0]["sort_id"] != null && ds.Tables[0].Rows[0]["sort_id"].ToString() != "")
                {
                    model.sort_id = int.Parse(ds.Tables[0].Rows[0]["sort_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["is_lock"] != null && ds.Tables[0].Rows[0]["is_lock"].ToString() != "")
                {
                    model.is_lock = int.Parse(ds.Tables[0].Rows[0]["is_lock"].ToString());
                }
                if (ds.Tables[0].Rows[0]["api_path"] != null && ds.Tables[0].Rows[0]["api_path"].ToString() != "")
                {
                    model.api_path = ds.Tables[0].Rows[0]["api_path"].ToString();
                }
                return model;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 根据接口目录返回一个实体
        /// </summary>
        public Model.user_oauth_app GetModel(string api_path)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 id from " + databaseprefix + "user_oauth_app");
            strSql.Append(" where api_path=@api_path");
            SqlParameter[] parameters = {
					new SqlParameter("@api_path", SqlDbType.NVarChar,100)};
            parameters[0].Value = api_path;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj != null)
            {
                return GetModel(Convert.ToInt32(obj));
            }
            return null;
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" id,title,img_url,app_id,app_key,remark,sort_id,is_lock,api_path ");
            strSql.Append(" FROM " + databaseprefix + "user_oauth_app ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperSQL.Query(strSql.ToString());
        }


        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * FROM " + databaseprefix + "user_oauth_app");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        #endregion  Method
    }
}