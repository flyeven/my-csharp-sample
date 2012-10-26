using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace W0300_WCF_Ajax
{


    /// <summary>
    /// Ajax  POST   处理.
    /// </summary>
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class WcfTestPostService
    {


        #region  简单 字符串参数 / 结果的.


        /// <summary>
        /// 简单调用服务端方法
        /// 
        /// 
        /// 这个方法 与 WcfTestService 中方法的代码是一致的
        /// 区别在于 标签的不同。
        /// 
        /// WcfTestService 中 定义的标签是 [WebGet()]
        /// 
        /// 本服务中，定义的标签是 [WebInvoke(Method = "POST")]
        /// 
        /// </summary>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        public string DoWork()
        {
            return string.Format("Today is {0}", DateTime.Now.ToString("yyyy年MM月dd日 HH:mm:ss:fff"));
        }



        /// <summary>
        /// 简单调用服务端方法
        /// 
        /// 用于测试， 传入一个参数.
        /// 
        /// 
        /// 这个方法 与 WcfTestService 中方法的代码是一致的
        /// 区别在于 标签的不同。
        /// 
        /// WcfTestService 中 定义的标签是 [WebGet()]
        /// 
        /// [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        /// 
        /// </summary>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        public string DoWork2(String hello)
        {
            return string.Format("{0}, Today is {1}", hello, DateTime.Now.ToString("yyyy年MM月dd日 HH:mm:ss:fff"));
        }


        /// <summary>
        /// 简单调用服务端方法
        /// 
        /// 用于测试， 传入两个参数.
        /// 
        /// 
        /// WcfTestService 中 定义的标签是 [WebGet()]
        /// 
        /// [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        /// 
        /// 
        /// </summary>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        public string DoWork3(String hello, string world)
        {
            return string.Format("{0}, {1}, Today is {2}", hello, world, DateTime.Now.ToString("yyyy年MM月dd日 HH:mm:ss:fff"));
        }


        #endregion



        





    }
}
