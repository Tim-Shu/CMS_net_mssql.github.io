﻿using QJcms.Common;
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
    /// 预存款记录日志
    /// </summary>
    public partial class user_amount_log
    {
        private string databaseprefix; //数据库表名前缀
        public user_amount_log(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }

        #region  Method
        /// <summary>
        /// 得到最大ID
        /// </summary>
        private int GetMaxId(SqlConnection conn, SqlTransaction trans)
        {
            string strSql = "select top 1 id from " + databaseprefix + "user_amount_log order by id desc";
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
            strSql.Append("select count(1) from " + databaseprefix + "user_amount_log");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.user_amount_log model)
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
                        strSql.Append("insert into " + databaseprefix + "user_amount_log(");
                        strSql.Append("user_id,user_name,[type],order_no,trade_no,payment_id,[value],remark,status,add_time,complete_time)");
                        strSql.Append(" values (");
                        strSql.Append("@user_id,@user_name,@type,@order_no,@trade_no,@payment_id,@value,@remark,@status,@add_time,@complete_time)");
                        SqlParameter[] parameters = {
					        new SqlParameter("@user_id", SqlDbType.Int,4),
					        new SqlParameter("@user_name", SqlDbType.NVarChar,100),
					        new SqlParameter("@type", SqlDbType.NVarChar,50),
                            new SqlParameter("@order_no", SqlDbType.NVarChar,100),
                            new SqlParameter("@trade_no", SqlDbType.NVarChar,100),
                            new SqlParameter("@payment_id", SqlDbType.Int,4),
					        new SqlParameter("@value", SqlDbType.Decimal,5),
					        new SqlParameter("@remark", SqlDbType.NVarChar,500),
					        new SqlParameter("@status", SqlDbType.Int,4),
					        new SqlParameter("@add_time", SqlDbType.DateTime),
                            new SqlParameter("@complete_time", SqlDbType.DateTime)};
                        parameters[0].Value = model.user_id;
                        parameters[1].Value = model.user_name;
                        parameters[2].Value = model.type;
                        parameters[3].Value = model.order_no;
                        parameters[4].Value = model.trade_no;
                        parameters[5].Value = model.payment_id;
                        parameters[6].Value = model.value;
                        parameters[7].Value = model.remark;
                        parameters[8].Value = model.status;
                        parameters[9].Value = model.add_time;
                        parameters[10].Value = model.complete_time;

                        DbHelperSQL.ExecuteSql(conn, trans, strSql.ToString(), parameters);
                        //取得新插入的ID
                        newId = GetMaxId(conn, trans);

                        if (model.status > 0)
                        {
                            StringBuilder strSql2 = new StringBuilder();
                            strSql2.Append("update " + databaseprefix + "users set amount=amount+" + model.value);
                            strSql2.Append(" where id=@id");
                            SqlParameter[] parameters2 = {
                                new SqlParameter("@id", SqlDbType.Int,4)};
                            parameters2[0].Value = model.user_id;
                            DbHelperSQL.ExecuteSql(conn, trans, strSql2.ToString(), parameters2);
                        }

                        trans.Commit();
                    }
                    catch
                    {
                        trans.Rollback();
                        return -1;
                    }
                }
            }
            return newId;
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.user_amount_log model)
        {
            using (SqlConnection conn = new SqlConnection(DbHelperSQL.connectionString))
            {
                conn.Open();
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    try
                    {
                        StringBuilder strSql = new StringBuilder();
                        strSql.Append("update " + databaseprefix + "user_amount_log set ");
                        strSql.Append("user_id=@user_id,");
                        strSql.Append("user_name=@user_name,");
                        strSql.Append("[type]=@type,");
                        strSql.Append("order_no=@order_no,");
                        strSql.Append("trade_no=@trade_no,");
                        strSql.Append("payment_id=@payment_id,");
                        strSql.Append("[value]=@value,");
                        strSql.Append("remark=@remark,");
                        strSql.Append("status=@status,");
                        strSql.Append("add_time=@add_time,");
                        strSql.Append("complete_time=@complete_time");
                        strSql.Append(" where id=@id");
                        SqlParameter[] parameters = {
					new SqlParameter("@user_id", SqlDbType.Int,4),
					new SqlParameter("@user_name", SqlDbType.NVarChar,100),
					new SqlParameter("@type", SqlDbType.NVarChar,50),
                    new SqlParameter("@order_no", SqlDbType.NVarChar,100),
                    new SqlParameter("@trade_no", SqlDbType.NVarChar,100),
                    new SqlParameter("@payment_id", SqlDbType.Int,4),
					new SqlParameter("@value", SqlDbType.Decimal,5),
					new SqlParameter("@remark", SqlDbType.NVarChar,500),
					new SqlParameter("@status", SqlDbType.Int,4),
					new SqlParameter("@add_time", SqlDbType.DateTime),
                    new SqlParameter("@complete_time", SqlDbType.DateTime),
					new SqlParameter("@id", SqlDbType.Int,4)};
                        parameters[0].Value = model.user_id;
                        parameters[1].Value = model.user_name;
                        parameters[2].Value = model.type;
                        parameters[3].Value = model.order_no;
                        parameters[4].Value = model.trade_no;
                        parameters[5].Value = model.payment_id;
                        parameters[6].Value = model.value;
                        parameters[7].Value = model.remark;
                        parameters[8].Value = model.status;
                        parameters[9].Value = model.add_time;
                        parameters[10].Value = model.complete_time;
                        parameters[11].Value = model.id;

                        DbHelperSQL.ExecuteSql(conn, trans, strSql.ToString(), parameters);

                        if (model.status > 0)
                        {
                            StringBuilder strSql2 = new StringBuilder();
                            strSql2.Append("update " + databaseprefix + "users set amount=amount+" + model.value);
                            strSql2.Append(" where id=@id");
                            SqlParameter[] parameters2 = {
                    new SqlParameter("@id", SqlDbType.Int,4)};
                            parameters2[0].Value = model.user_id;
                            DbHelperSQL.ExecuteSql(conn, trans, strSql2.ToString(), parameters2);
                        }

                        trans.Commit();
                    }
                    catch { trans.Rollback(); return false; }
                }
            }
            return true;
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from " + databaseprefix + "user_amount_log ");
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
        public bool Delete(int id, string user_name)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from " + databaseprefix + "user_amount_log ");
            strSql.Append(" where id=@id and user_name=@user_name");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4),
                    new SqlParameter("@user_name", SqlDbType.NVarChar,100)};
            parameters[0].Value = id;
            parameters[1].Value = user_name;

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
        public Model.user_amount_log GetModel(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,user_id,user_name,[type],order_no,trade_no,payment_id,[value],remark,status,add_time,complete_time from " + databaseprefix + "user_amount_log ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
            parameters[0].Value = id;

            Model.user_amount_log model = new Model.user_amount_log();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["id"] != null && ds.Tables[0].Rows[0]["id"].ToString() != "")
                {
                    model.id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["user_id"] != null && ds.Tables[0].Rows[0]["user_id"].ToString() != "")
                {
                    model.user_id = int.Parse(ds.Tables[0].Rows[0]["user_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["user_name"] != null && ds.Tables[0].Rows[0]["user_name"].ToString() != "")
                {
                    model.user_name = ds.Tables[0].Rows[0]["user_name"].ToString();
                }
                if (ds.Tables[0].Rows[0]["type"] != null && ds.Tables[0].Rows[0]["type"].ToString() != "")
                {
                    model.type = ds.Tables[0].Rows[0]["type"].ToString();
                }
                if (ds.Tables[0].Rows[0]["order_no"] != null && ds.Tables[0].Rows[0]["order_no"].ToString() != "")
                {
                    model.order_no = ds.Tables[0].Rows[0]["order_no"].ToString();
                }
                if (ds.Tables[0].Rows[0]["trade_no"] != null && ds.Tables[0].Rows[0]["trade_no"].ToString() != "")
                {
                    model.order_no = ds.Tables[0].Rows[0]["trade_no"].ToString();
                }
                if (ds.Tables[0].Rows[0]["payment_id"] != null && ds.Tables[0].Rows[0]["payment_id"].ToString() != "")
                {
                    model.payment_id = int.Parse(ds.Tables[0].Rows[0]["payment_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["value"] != null && ds.Tables[0].Rows[0]["value"].ToString() != "")
                {
                    model.value = decimal.Parse(ds.Tables[0].Rows[0]["value"].ToString());
                }
                if (ds.Tables[0].Rows[0]["remark"] != null && ds.Tables[0].Rows[0]["remark"].ToString() != "")
                {
                    model.remark = ds.Tables[0].Rows[0]["remark"].ToString();
                }
                if (ds.Tables[0].Rows[0]["status"] != null && ds.Tables[0].Rows[0]["status"].ToString() != "")
                {
                    model.status = int.Parse(ds.Tables[0].Rows[0]["status"].ToString());
                }
                if (ds.Tables[0].Rows[0]["add_time"] != null && ds.Tables[0].Rows[0]["add_time"].ToString() != "")
                {
                    model.add_time = DateTime.Parse(ds.Tables[0].Rows[0]["add_time"].ToString());
                }
                if (ds.Tables[0].Rows[0]["complete_time"] != null && ds.Tables[0].Rows[0]["complete_time"].ToString() != "")
                {
                    model.complete_time = DateTime.Parse(ds.Tables[0].Rows[0]["complete_time"].ToString());
                }
                return model;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 根据订单号返回一个实体
        /// </summary>
        public Model.user_amount_log GetModel(string order_no)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id from " + databaseprefix + "user_amount_log");
            strSql.Append(" where order_no=@order_no");
            SqlParameter[] parameters = {
					new SqlParameter("@order_no", SqlDbType.NVarChar,100)};
            parameters[0].Value = order_no;

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
            strSql.Append(" id,user_id,user_name,[type],order_no,trade_no,payment_id,[value],remark,status,add_time,complete_time ");
            strSql.Append(" FROM " + databaseprefix + "user_amount_log ");
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
            strSql.Append("select * FROM " + databaseprefix + "user_amount_log");
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