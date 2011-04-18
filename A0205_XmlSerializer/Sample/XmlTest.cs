using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml;
using System.Xml.Serialization;

namespace A0205_XmlSerializer.Sample
{
    /// <summary>
    /// 这里测试一个 使用 XmlSerializer 读写 XML 文件的例子.
    /// </summary>
    public class XmlTest
    {

        private const string FILE_NAME = "OrangeStorage.xml";

        /// <summary>
        /// 测试写入数据.
        /// </summary>
        public void TestWrite()
        {
            OrangeStorage storage = new OrangeStorage();
            storage.StorageName = "Test";

            storage.OrangeArray = new Orange[2];

            Orange o1 = new Orange("中国", "红", "甜");
            Orange o2 = new Orange("美国", "黄", "酸");

            storage.OrangeArray[0] = o1;
            storage.OrangeArray[1] = o2;


            storage.OrangeList = new OrangeList();

            storage.OrangeList.Add(o1);
            storage.OrangeList.Add(o2);


            XmlSerializer xs = new XmlSerializer(typeof(OrangeStorage));
            StreamWriter sw = new StreamWriter(FILE_NAME);
            xs.Serialize(sw, storage);
            sw.Close();
        }


        /// <summary>
        /// 测试读取.
        /// </summary>
        public void TestRead()
        {
            XmlSerializer xs = new XmlSerializer(typeof(OrangeStorage));
            StreamReader sr = new StreamReader(FILE_NAME);
            OrangeStorage storage = xs.Deserialize(sr) as OrangeStorage;
            sr.Close();

            Console.WriteLine(storage.StorageName);
            foreach (Orange o in storage.OrangeArray)
            {
                Console.WriteLine(o.ToString());
            }

            foreach (Orange o in storage.OrangeList)
            {
                Console.WriteLine(o.ToString());
            }
        }

    }



    /// <summary>
    /// 用于 保存数据 的类.
    /// </summary>
    [XmlRootAttribute("OrangeStorage", IsNullable = false)]
    public class OrangeStorage
    {
        /// <summary>
        /// 商店名.
        /// </summary>
        [XmlAttribute]
        public string StorageName { set; get; }

        /// <summary>
        /// 桔子数组.
        /// </summary>
        [XmlArrayAttribute("Oranges")]
        public Orange [] OrangeArray { set; get; }


        /// <summary>
        /// 桔子列表.
        /// </summary>
        public OrangeList OrangeList { set; get; }
    }


    public class OrangeList : List<Orange> { }

    /// <summary>
    /// 用于 保存数据 的类.
    /// </summary>
    [XmlRootAttribute("Orange", IsNullable = false)]
    public class Orange
    {

        /// <summary>
        /// 国家
        /// </summary>
        private String country;

        /// <summary>
        /// 苹果的颜色.
        /// </summary>
        private String color;

        /// <summary>
        /// 味道
        /// </summary>
        private String sapor;

        public Orange()
        {
        }

        /// <summary>
        /// 构造函数.
        /// </summary>
        /// <param name="country"></param>
        /// <param name="color"></param>
        /// <param name="sapor"></param>
        public Orange(String country, String color, String sapor)
        {
            this.country = country;
            this.color = color;
            this.sapor = sapor;
        }

        [XmlAttribute("Country")]
        public String Country
        {
            get
            {
                return country;
            }
        }

        [XmlAttribute("Color")]
        public String Color
        {
            get
            {
                return color;
            }
        }

        [XmlAttribute("Sapor")]
        public String Sapor
        {
            get
            {
                return sapor;
            }
        }


        public override string ToString()
        {
            return country + "产" + color + "色" + sapor + "桔子";
        }

    }

}
