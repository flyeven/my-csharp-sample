﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Text.RegularExpressions;

namespace W0300_WCF_Ajax
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            // 检测匹配的正则表达式
            string pat = @"(\w+)(.test.cn)";


            // 取得用户输入的域名.
            string host = HttpContext.Current.Request.Headers["host"];

            // 取得用户输入的网页地址.
            string oldUrl = HttpContext.Current.Request.RawUrl;


            if (oldUrl == "/")
            {
                // 用户输入的是 完整的域名. 不包含后续地址.


                // 初始化 正则表达式  忽略大小写
                Regex r = new Regex(pat, RegexOptions.IgnoreCase);

                // 指定的输入字符串中搜索 Regex 构造函数中指定的正则表达式的第一个匹配项。
                Match m = r.Match(host);

                // 如果匹配成功了.
                if (m.Success)
                {
                    Group g = m.Groups[1];
                    Console.WriteLine(g.Value);
                    string param = g.Value;

                    if (param != "www")
                    {
                        string newUrl = String.Format("/TestReWriteUrl.aspx?code={0}", param);
                        this.Context.RewritePath(newUrl);
                    }
                    else
                    {
                        // 迁移到首页.
                        this.Context.RewritePath("/index.htm");
                    }
                }
            }





        }




        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}