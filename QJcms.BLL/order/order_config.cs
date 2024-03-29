﻿using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Web;
using System.Web.Caching;
using QJcms.Common;

namespace QJcms.BLL
{
    public partial class orderconfig
    {
        private readonly DAL.orderconfig dal = new DAL.orderconfig();
        /// <summary>
        ///  读取用户配置文件
        /// </summary>
        public Model.orderconfig loadConfig()
        {
            Model.orderconfig model = CacheHelper.Get<Model.orderconfig>(QJConst.CACHE_ORDER_CONFIG);
            if (model == null)
            {
                CacheHelper.Insert(QJConst.CACHE_ORDER_CONFIG, dal.loadConfig(Utils.GetXmlMapPath(QJConst.FILE_ORDER_XML_CONFING)),
                    Utils.GetXmlMapPath(QJConst.FILE_ORDER_XML_CONFING));
                model = CacheHelper.Get<Model.orderconfig>(QJConst.CACHE_ORDER_CONFIG);
            }
            return model;
        }

        /// <summary>
        ///  保存用户配置文件
        /// </summary>
        public Model.orderconfig saveConifg(Model.orderconfig model)
        {
            return dal.saveConifg(model, Utils.GetXmlMapPath(QJConst.FILE_ORDER_XML_CONFING));
        }
    }
}
