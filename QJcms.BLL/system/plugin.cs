﻿using System;
using System.Collections.Generic;
using System.Text;
using QJcms.Common;

namespace QJcms.BLL
{
    public partial class plugin
    {
        private readonly DAL.plugin dal;

        public plugin()
        {
            dal = new DAL.plugin(QJKey.DatabasePrefix);
        }

        /// <summary>
        /// 返回插件列表
        /// </summary>
        /// <param name="dirPath">站点下的插件路径(物理路径)</param>
        public List<Model.plugin> GetList(string dirPath)
        {
            return dal.GetList(dirPath);
        }

        /// <summary>
        /// 返回插件说明信息
        /// </summary>
        /// <param name="dirPath">插件目录路径(不包含文件名)</param>
        /// <returns>插件配置信息</returns>
        public Model.plugin GetInfo(string dirPath)
        {
            return dal.GetInfo(dirPath);
        }

        /// <summary>
        /// 生成模板文件
        /// </summary>
        /// <param name="sitePath">站点安装目录</param>
        /// <param name="tempPath">模板路径</param>
        /// <param name="skinName">模板目录名</param>
        /// <param name="dirPath">插件配置文件物理目录路径</param>
        /// <param name="xPath">节点</param>
        public void MarkTemplet(string sitePath, string tempPath, string skinName, string dirPath, string xPath)
        {
            dal.MarkTemplet(sitePath, tempPath, skinName, dirPath, xPath);
        }

        /// <summary>
        /// 修改插件节点数据
        /// </summary>
        /// <param name="dirPath">插件目录路径</param>
        /// <param name="node">节点</param>
        /// <param name="value">值</param>
        /// <returns></returns>
        public bool UpdateNodeValue(string dirPath, string node, string value)
        {
            return dal.UpdateNodeValue(dirPath, node, value);
        }

        /// <summary>
        /// 执行插件SQL语句
        /// </summary>
        /// <param name="dirPath">插件目录路径</param>
        /// <param name="xPath">节点</param>
        public bool ExeSqlStr(string dirPath, string xPath)
        {
            return dal.ExeSqlStr(dirPath, xPath);
        }

        /// <summary>
        /// 添加URL映射节点
        /// </summary>
        /// <param name="dirPath">插件目录路径</param>
        /// <param name="xPath">节点</param>
        public bool AppendNodes(string dirPath, string xPath)
        {
            return dal.AppendNodes(dirPath, xPath);
        }

        /// <summary>
        /// 删除URL映射节点
        /// </summary>
        /// <param name="dirPath">插件目录路径</param>
        /// <param name="xPath">节点</param>
        public bool RemoveNodes(string dirPath, string xPath)
        {
            return dal.RemoveNodes(dirPath, xPath);
        }

        /// <summary>
        /// 添加后台管理导航
        /// </summary>
        public bool AppendMenuNodes(string navPath, string dirPath, string xPath, string parentName)
        {
            int parentId = new BLL.navigation().GetNavId(parentName); //查找导航父节点的ID
            if (parentId < 1)
            {
                return false;
            }
            return dal.AppendMenuNodes(navPath, dirPath, xPath, parentId);
        }

        /// <summary>
        /// 删除后台管理导航
        /// </summary>
        public void RemoveMenuNodes(string dirPath, string xPath)
        {
            dal.RemoveMenuNodes(dirPath, xPath);
        }

    }
}
