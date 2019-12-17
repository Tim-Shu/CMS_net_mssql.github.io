using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using QJcms.Common;

namespace QJcms.BLL
{
    /// <summary>
    /// ϵͳƵ����
    /// </summary>
    public partial class channel
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //���վ��������Ϣ
        private readonly DAL.channel dal;

        public channel()
        {
            dal = new DAL.channel(QJKey.DatabasePrefix);
        }

        #region ��������========================================

        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(int id)
        {
            return dal.Exists(id);
        }

        /// <summary>
        /// ��ѯƵ�������Ƿ����
        /// </summary>
        public bool Exists(string name)
        {
            //��վ��Ŀ¼�µ�һ���ļ����Ƿ�ͬ��
            if (DirPathExists(siteConfig.webpath, name))
            {
                return true;
            }
            //��վ��aspxĿ¼�µ�һ���ļ����Ƿ�ͬ��
            if (DirPathExists(siteConfig.webpath + "/" + QJConst.DIRECTORY_REWRITE_ASPX + "/", name))
            {
                return true;
            }
            //����ڵ�Ƶ�������Ƿ�ͬ��
            if (dal.Exists(name))
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// ������������
        /// </summary>
        public int GetCount(string strWhere)
        {
            return dal.GetCount(strWhere);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public int Add(Model.channel model)
        {
            //ȡ������Ƶ�����������Ŀ¼
            string build_path =new BLL.channel_category().GetBuildPath(model.category_id);
            if (string.IsNullOrEmpty(build_path))
            {
                return 0;
            }
            //��ʼ����Ƶ����Ϣ
            int channelId = dal.Add(model);
            if (channelId > 0)
            {
                //���ӵ����˵�
                int newNavId = new BLL.navigation().Add("channel_" + build_path, "channel_" + model.name, model.title, "", model.sort_id, channelId, "Show");
                if (newNavId < 1)
                {
                    dal.Delete(channelId);
                    return 0;
                }
                //�����ӵ����˵�
                new BLL.navigation().Add("channel_" + model.name, "channel_" + model.name + "_list", model.content_name, "article/article_list.aspx", 99, channelId, "Show,View,Add,Edit,Delete,System,Audit,MultiUpload");
                if (model.deep_layer > 0)
                {
                    new BLL.navigation().Add("channel_" + model.name, "channel_" + model.name + "_category", model.category_name, "article/category_list.aspx", 100, channelId, "Show,View,Add,Edit,Delete,System");
                }
                if (model.is_comment==1)
                {
                    new BLL.navigation().Add("channel_" + model.name, "channel_" + model.name + "_comment", model.comment_name, "article/comment_list.aspx", 101, channelId, "Show,View,Delete,Audit,Reply");
                }
            }
            return channelId;
        }

        /// <summary>
        /// �޸�һ������
        /// </summary>
        public void UpdateField(int id, string strValue)
        {
            dal.UpdateField(id, strValue);
        }

        /// <summary>
        /// ��������
        /// </summary>
        public bool UpdateSort(int id, int sort_id)
        {
            //ȡ��Ƶ��������
            string channel_name = dal.GetChannelName(id);
            if (channel_name == string.Empty)
            {
                return false;
            }
            if (new BLL.navigation().UpdateField("channel_" + channel_name, "sort_id=" + sort_id))
            {
                dal.UpdateField(id, "sort_id=" + sort_id);
                return true;
            }
            return false;
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public bool Update(Model.channel model)
        {
            //ȡ������Ƶ�����������Ŀ¼
            string build_path =new BLL.channel_category().GetBuildPath(model.category_id);
            if (string.IsNullOrEmpty(build_path))
            {
                return false;
            }
            //ȡ������Ƶ�������ڵ����е�ID
            int parent_id = new BLL.navigation().GetNavId("channel_" + build_path);
            if (parent_id == 0)
            {
                return false;
            }
            //ȡ�þɵ�����
            Model.channel oldModel = dal.GetModel(model.id);
            //��ʼ�޸�����
            if (dal.Update(model))
            {
                //������ƺͱ��ⷢ���ı����޸Ķ�Ӧ�ĵ���
                if (model.name != oldModel.name || model.title != oldModel.title || model.category_id != oldModel.category_id || model.sort_id != oldModel.sort_id || model.is_comment != oldModel.is_comment || model.content_name != oldModel.content_name || model.category_name != oldModel.category_name || model.comment_name != oldModel.comment_name || model.deep_layer != oldModel.deep_layer)
                {
                    BLL.navigation navBLL = new BLL.navigation();
                    Model.navigation navModel = navBLL.GetModel("channel_" + oldModel.name);
                    if (navModel != null)
                    {
                        navModel.name = "channel_" + model.name;
                        navModel.title = model.title;
                        navModel.parent_id = parent_id;
                        navModel.sort_id = model.sort_id;
                        navBLL.Update(navModel);


                        //�޸��ӵ����˵�
                        //���ݹ���
                        Model.navigation navContentModel = navBLL.GetModel("channel_" + oldModel.name + "_list");
                        if (navContentModel != null)
                        {
                            navContentModel.name = "channel_" + model.name + "_list";
                            navContentModel.title = model.content_name;
                            navBLL.Update(navContentModel);
                        }
                        //��Ŀ���
                        Model.navigation navCategoryModel = navBLL.GetModel("channel_" + oldModel.name + "_category");
                        if (navCategoryModel != null)
                        {
                            navCategoryModel.name = "channel_" + model.name + "_category";
                            navCategoryModel.title = model.category_name;
                            if (model.deep_layer > 0)
                            {
                                navCategoryModel.is_lock = 0;
                            }
                            else
                            {
                                navCategoryModel.is_lock = 1;
                            }
                            navBLL.Update(navCategoryModel);
                        }
                        else
                        {
                            if (model.deep_layer > 0)
                            {
                                navBLL.Add("channel_" + model.name, "channel_" + model.name + "_category", model.category_name, "article/category_list.aspx", 100, model.id, "Show,View,Add,Edit,Delete,System");
                            }
                        }
                        //���۹���
                        Model.navigation navCommentModel = navBLL.GetModel("channel_" + oldModel.name + "_comment");
                        if (navCommentModel != null)
                        {
                            navCommentModel.name = "channel_" + model.name + "_comment";
                            navCommentModel.title = model.comment_name;
                            if (model.is_comment == 1)
                            {
                                navCommentModel.is_lock = 0;
                            }
                            else
                            {
                                navCommentModel.is_lock = 1;
                            }
                            navBLL.Update(navCommentModel);
                        }
                    }
                }
                return true;
            }
            return false;
        }

        /// <summary>
        /// ɾ��һ������
        /// </summary>
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }

        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public Model.channel GetModel(int id)
        {
            return dal.GetModel(id);
        }

        /// <summary>
        /// ���ǰ��������
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(Top, strWhere, filedOrder);
        }

        /// <summary>
        /// ��ò�ѯ��ҳ����
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        #endregion

        #region ��չ����========================================
        /// <summary>
        /// ����Ƶ�������Ʋ�ѯID
        /// </summary>
        public int GetChannelId(string channel_name)
        {
            return dal.GetChannelId(channel_name);
        }

        /// <summary>
        /// ����Ƶ����ID��ѯ����
        /// </summary>
        public string GetChannelName(int id)
        {
            return dal.GetChannelName(id);
        }

        /// <summary>
        /// ����Ƶ�������ƻ�ȡʵ�����
        /// </summary>
        /// <param name="channel_name"></param>
        /// <returns></returns>
        public Model.channel GetModel(string channel_name)
        {
            return dal.GetModel(channel_name);
        }
        /// <summary>
        /// ��ȡ��ҳ��С
        /// </summary>
        public int GetPageSize(string channel_name)
        {
            return dal.GetPageSize(channel_name);
        }
        /// <summary>
        /// �������Ŀ¼����ָ��·���µ�һ��Ŀ¼�Ƿ�ͬ��
        /// </summary>
        /// <param name="dirPath">ָ����·��</param>
        /// <param name="build_path">����Ŀ¼��</param>
        /// <returns>bool</returns>
        private bool DirPathExists(string dirPath, string build_path)
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Utils.GetMapPath(dirPath));
            foreach (DirectoryInfo dir in dirInfo.GetDirectories())
            {
                if (build_path.ToLower() == dir.Name.ToLower())
                {
                    return true;
                }
            }
            return false;
        }

        #endregion
    }
}