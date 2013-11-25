using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;



namespace W0300_WCF_Ajax.Autocomplete
{
    /// <summary>
    /// JsonSearch 的摘要说明
    /// </summary>
    public class JsonSearch : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            // 取得查询关键字.
            string queryKeyword = context.Request["q"];

            var query =
                from data in TestCityData.testCityList
                where data.CityKeyword.Contains(queryKeyword)
                group data by data.CityName;



            List<string> result = query.Select(p=>p.Key).ToList();
            // 构造 序列化类.
            DataContractJsonSerializer dcjs = new DataContractJsonSerializer(result.GetType());
            using (MemoryStream st = new MemoryStream())
            {
                // 写入数据流 
                dcjs.WriteObject(st, result);
                // 读取流， 并输出.
                byte[] buff = st.ToArray();
                string jsonString = System.Text.Encoding.UTF8.GetString(buff);
                context.Response.Write(jsonString);
            }
        }




        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}