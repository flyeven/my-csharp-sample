using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Security.Cryptography;

using C0010_SecretKeyEncryption.Util;

namespace C0200_HashValues.Sample
{
    class HashTest
    {


        public static void DoTest()
        {
            Console.WriteLine("MD5 测试！");

            UnicodeEncoding ByteConverter = new UnicodeEncoding();
            string source = "Data to Encrypt  这个是一个用于测试MD5的文本信息！";

            byte[] dataToEncrypt = ByteConverter.GetBytes(source);

            Console.WriteLine("原始文本信息：{0}", source);
            Console.WriteLine("原始数据！");
            ByteArrayOutput.Print(dataToEncrypt);



            Console.WriteLine("MD5");
            ByteArrayOutput.Print(MD5hash(dataToEncrypt));

            Console.WriteLine("SHA256");
            ByteArrayOutput.Print(SHA256hash(dataToEncrypt));

            Console.WriteLine("SHA384");
            ByteArrayOutput.Print(SHA384hash(dataToEncrypt));

            Console.WriteLine("SHA512");
            ByteArrayOutput.Print(SHA512hash(dataToEncrypt));
        }





        /// <summary>
        /// 计算 MD5.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        static byte[] MD5hash(byte[] data)
        {
            // This is one implementation of the abstract class MD5.
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] result = md5.ComputeHash(data);
            return result;
        }



        /// <summary>
        /// 计算 SHA256 哈希值。
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        static byte[] SHA256hash(byte[] data)
        {
            SHA256 shaM = new SHA256Managed();
            byte[] result = shaM.ComputeHash(data);
            return result;
        }


        /// <summary>
        /// 计算 SHA384  哈希值。
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        static byte[] SHA384hash(byte[] data)
        {
            SHA384 shaM = new SHA384Managed();
            byte[] result = shaM.ComputeHash(data);
            return result;
        }


        /// <summary>
        /// 计算 SHA512  哈希值。
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        static byte[] SHA512hash(byte[] data)
        {
            SHA512 shaM = new SHA512Managed();
            byte[] result = shaM.ComputeHash(data);
            return result;
        }


    }
}
