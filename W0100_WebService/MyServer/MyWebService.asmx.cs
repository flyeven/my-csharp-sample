using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Diagnostics;


namespace MyServer
{
    /// <summary>
    /// MyWebService
    /// 
    /// Web 服务的  服务器端 例子代码
    /// 
    /// 具体操作步骤是： 
    /// 1、创建一个 空白的 ASP.NET  Web  项目
    /// 2、新建一个 Web 服务.
    /// 3、新建的代码， 将自动带有一个  HelloWorld 的方法.
    /// 4、运行项目
    /// 5、在 IE 浏览器中， 复制 Web 服务地址.
    /// 6、在 客户端项目中，添加 Service 引用
    /// 7、客户端 通过创建 引用的 Client ， 调研 Web 服务代码.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class MyWebService : System.Web.Services.WebService
    {


        /// <summary>
        /// 自动生成的 HelloWorld 方法.
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }




        /// <summary>
        /// 模拟一个 登录的处理.
        /// 
        /// 需要注意，作为 Web 服务的一个方法
        /// 那个 [  WebMethod  ]  必须要 定义 在方法的上面！
        /// 
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <param name="resultMessage"></param>
        /// <returns></returns>
        [WebMethod]
        public bool DoLogin(string username, string password, ref string resultMessage)
        {
            if ( String.IsNullOrEmpty ( username)
                || String.IsNullOrEmpty(password))
            {
                resultMessage = "用户名或密码不能为空！";
                return false;
            }

            if (username != "TEST" || password != "TEST")
            {
                resultMessage = "登录失败！";
                return false;
            }


            resultMessage = "登录成功！";
            return true;
        }


    }
}
