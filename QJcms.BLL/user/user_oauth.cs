using System;
using System.Data;
using System.Collections.Generic;
using QJcms.Common;

namespace QJcms.BLL
{
    /// <summary>
    /// OAuth授权用户信息
    /// </summary>
    public partial class user_oauth
    {
        private readonly DAL.user_oauth dal;
        public user_oauth()
        {
            dal = new DAL.user_oauth(QJKey.DatabasePrefix);
        }

        #region  Method
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            return dal.Exists(id);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.user_oauth model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.user_oauth model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.user_oauth GetModel(int id)
        {
            return dal.GetModel(id);
        }

        /// <summary>
        /// 根据开放平台和openid返回一个实体
        /// </summary>
        public Model.user_oauth GetModel(string oauth_name, string oauth_openid)
        {
            return dal.GetModel(oauth_name, oauth_openid);
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(Top, strWhere, filedOrder);
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        #endregion  Method
    }
}