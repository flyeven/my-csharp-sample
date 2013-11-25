using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace W0300_WCF_Ajax.Login
{
    /// <summary>
    /// CustomerLoginHandler 的摘要说明
    /// </summary>
    public class CustomerLoginHandler : AbstractHandler
    {

        protected override CommonHandleResult GetDefaultHandleResult()
        {
            return new CommonHandleResult()
            {
                Result = false,
            };
        }



        /// <summary>
        /// 登录失败次数.
        /// </summary>
        private const string Session_Keyword_Is_Pbulic_User_LoginFailCount = "LoginFailCount";



        protected override void DoProcess(HttpContext context, CommonHandleResult result)
        {
            string userName = context.Request["u"];
            string password = context.Request["p"];
            string checkCode = context.Request["c"];

            int loginFailCount = 0;
            if (context.Session[Session_Keyword_Is_Pbulic_User_LoginFailCount] != null)
            {
                loginFailCount = Convert.ToInt32(context.Session[Session_Keyword_Is_Pbulic_User_LoginFailCount]);
            }


            if (String.IsNullOrEmpty(userName))
            {
                result.ResultMessage = "用户名没有填写！";
                return;
            }

            if (String.IsNullOrEmpty(password))
            {
                result.ResultMessage = "密码没有填写！";
                return;
            }


            if (loginFailCount > 0)
            {
                if (String.IsNullOrEmpty(checkCode))
                {
                    result.ResultMessage = "验证码没有填写！";
                    return;
                }
                string cc = context.Session["CheckCode"] as string;
                if (cc != checkCode.ToUpper())
                {
                    result.ResultMessage = "验证码不正确！";
                    return;
                }
            }



           
            if (userName != "admin")
            {
                // 用户不存在.
                result.ResultMessage = "用户名不存在，或者密码错误！";
                loginFailCount++;
                context.Session[Session_Keyword_Is_Pbulic_User_LoginFailCount] = loginFailCount;
                return;
            }
            if (password != "admin")
            {
                // 密码不匹配.
                result.ResultMessage = "用户名不存在，或者密码错误！！";
                loginFailCount++;
                context.Session[Session_Keyword_Is_Pbulic_User_LoginFailCount] = loginFailCount;
                return;
            }

            // 成功.
            context.Session[Session_Keyword_Is_Pbulic_User] = userName;

            result.Result = true;
            result.ResultMessage = "登录成功！";
        }


        protected override bool IsNeedLogin()
        {
            return false;
        }

    }
}