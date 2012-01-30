using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace A0101_Serializable.Model
{
    

    /// <summary>
    /// 用于存储数据的类.
    /// </summary>
    [Serializable]
    public class DataObject
    {

        /// <summary>
        /// 测试保存数据的属性.
        /// 用户名.
        /// </summary>
        public string UserName { set; get; }


        /// <summary>
        /// 测试保存数据的属性.
        /// 好友名列表.
        /// </summary>
        public List<string> FirendList { set; get; }



        /// <summary>
        /// 调试用。
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            StringBuilder buff = new StringBuilder();

            buff.AppendFormat("UserName = {0} ", UserName);

            if (FirendList != null)
            {
                buff.AppendLine();
                buff.Append("FirendList = [ ");

                foreach (string f in FirendList)
                {
                    buff.Append(f);
                    buff.Append(' ');
                }

                buff.Append("]");
            }

            buff.AppendLine();

            return buff.ToString();
        }


    }



}
