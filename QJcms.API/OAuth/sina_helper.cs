﻿using System;
using System.Collections.Generic;
using System.Text;
using QJcms.Common;
using LitJson;

namespace QJcms.API.OAuth
{
    public class sina_helper
    {
        public sina_helper()
        { }

        /// <summary>
        /// 取得Access Token
        /// </summary>
        /// <param name="code">临时Authorization Code，官方提示10分钟过期</param>
        /// <param name="state">防止CSRF攻击，成功授权后回调时会原样带回</param>
        /// <returns>Dictionary</returns>
        public static Dictionary<string, object> get_access_token(string code)
        {
            //获得配置信息
            oauth_config config = oauth_helper.get_config("sina");
            string send_url = "https://api.weibo.com/oauth2/access_token";
            string param = "grant_type=authorization_code&code=" + code + "&client_id=" + config.oauth_app_id + "&client_secret=" + config.oauth_app_key + "&redirect_uri=" + Utils.UrlEncode(config.return_uri);
            //发送并接受返回值
            string result = Utils.HttpPost(send_url, param);
            if (result.Contains("error"))
            {
                return null;
            }
            try
            {
                Dictionary<string, object> dic = JsonMapper.ToObject<Dictionary<string, object>>(result);
                return dic;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 查询用户access_token的授权相关信息
        /// </summary>
        /// <param name="access_token">Access Token</param>
        /// <returns>Dictionary<T></returns>
        public static Dictionary<string, object> get_token_info(string access_token)
        {
            string send_url = "https://api.weibo.com/oauth2/get_token_info";
            string param = "access_token=" + access_token;
            //发送并接受返回值
            string result = Utils.HttpPost(send_url, param);
            if (result.Contains("error"))
            {
                return null;
            }
            try
            {
                Dictionary<string, object> dic = JsonMapper.ToObject<Dictionary<string, object>>(result);
                return dic;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 获取登录用户自己的详细信息
        /// </summary>
        /// <param name="access_token">临时的Access Token</param>
        /// <param name="open_id">用户属性，以英文逗号分隔</param>
        /// <returns>JsonData</returns>
        public static JsonData get_info(string access_token, string open_id)
        {
            string send_url = "https://api.weibo.com/2/users/show.json?access_token=" + access_token + "&uid=" + open_id;
            //发送并接受返回值
            string result = Utils.HttpGet(send_url);
            if (result.Contains("error"))
            {
                return null;
            }
            try
            {
                JsonData jd = JsonMapper.ToObject(result);
                if (jd.Count > 0)
                {
                    return jd;
                }
            }
            catch
            {
                return null;
            }
            return null;
        }

    }
}
