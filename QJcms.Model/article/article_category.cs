﻿using System;
using System.Collections.Generic;

namespace QJcms.Model
{
    /// <summary>
    /// 内容类别
    /// </summary>
    [Serializable]
    public partial class article_category
    {
        public article_category()
        { }
        #region Model
        private int _id;
        private int _channel_id = 0;
        private string _title;
        private string _sub_title = "";
        private string _call_index = "";
        private int _parent_id = 0;
        private string _class_list = "";
        private int _class_layer = 1;
        private int _sort_id = 99;
        private string _link_url="";
        private string _img_url="";
        private string _content="";
        private string _seo_title="";
        private string _seo_keywords="";
        private string _seo_description="";
        private int _is_parent = 0;
        private int _is_sys = 0;
        private int _is_hot = 0;

        /// <summary>
        /// 自增ID
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 所属栏目ID
        /// </summary>
        public int channel_id
        {
            set { _channel_id = value; }
            get { return _channel_id; }
        }
        /// <summary>
        /// 类别标题
        /// </summary>
        public string title
        {
            set { _title = value; }
            get { return _title; }
        }
        /// <summary>
        /// 类别副标题
        /// </summary>
        public string sub_title
        {
            get { return _sub_title; }
            set { _sub_title = value; }
        }
        /// <summary>
        /// 调用别名
        /// </summary>
        public string call_index
        {
            set { _call_index = value; }
            get { return _call_index; }
        }
        /// <summary>
        /// 父类别ID
        /// </summary>
        public int parent_id
        {
            set { _parent_id = value; }
            get { return _parent_id; }
        }
        /// <summary>
        /// 字类别ID列表(逗号分隔开)
        /// </summary>
        public string class_list
        {
            set { _class_list = value; }
            get { return _class_list; }
        }
        /// <summary>
        /// 类别深度
        /// </summary>
        public int class_layer
        {
            set { _class_layer = value; }
            get { return _class_layer; }
        }
        /// <summary>
        /// 排序数字
        /// </summary>
        public int sort_id
        {
            set { _sort_id = value; }
            get { return _sort_id; }
        }
        /// <summary>
        /// URL跳转地址
        /// </summary>
        public string link_url
        {
            set { _link_url = value; }
            get { return _link_url; }
        }
        /// <summary>
        /// 图片地址
        /// </summary>
        public string img_url
        {
            set { _img_url = value; }
            get { return _img_url; }
        }
        /// <summary>
        /// 备注说明
        /// </summary>
        public string content
        {
            set { _content = value; }
            get { return _content; }
        }
        /// <summary>
        /// SEO标题
        /// </summary>
        public string seo_title
        {
            set { _seo_title = value; }
            get { return _seo_title; }
        }
        /// <summary>
        /// SEO关健字
        /// </summary>
        public string seo_keywords
        {
            set { _seo_keywords = value; }
            get { return _seo_keywords; }
        }
        /// <summary>
        /// SEO描述
        /// </summary>
        public string seo_description
        {
            set { _seo_description = value; }
            get { return _seo_description; }
        }
        /// <summary>
        /// 是否含有子类 0：不含 1：有
        /// </summary>
        public int is_parent
        {
            set { _is_parent = value; }
            get { return _is_parent; }
        }
        /// <summary>
        /// 系统类别
        /// </summary>
        public int is_sys
        {
            get { return _is_sys; }
            set { _is_sys = value; }
        }
        /// <summary>
        /// 热门类别
        /// </summary>
        public int is_hot
        {
            get { return _is_hot; }
            set { _is_hot = value; }
        }
        private List<article_images_size> _imagesize_values;
        /// <summary>
        /// 图片尺寸
        /// </summary>
        public List<article_images_size> imagesize_values
        {
            set { _imagesize_values = value; }
            get { return _imagesize_values; }
        }


        /// <summary>
        /// 图片相册
        /// </summary>
        private List<article_category_albums> _albums;
        public List<article_category_albums> albums
        {
            set { _albums = value; }
            get { return _albums; }
        }
        #endregion Model
    }
}