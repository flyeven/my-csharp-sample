using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace C0010_SecretKeyEncryption.Util
{

    /// <summary>
    /// 用于输出  byte 数组中的相关信息.
    /// </summary>
    public class ByteArrayOutput
    {


        public static void Print(byte[] byteArray)
        {
            Console.WriteLine("--------------------------------------------------------------");
            Console.WriteLine("00  01  02  03  04  05  06  07  08  09  0A  0B  0C  0D  0E  0F");
            Console.Write("--------------------------------------------------------------");
            for (int i = 0; i < byteArray.Length; i++)
            {
                if (i % 16 == 0)
                {
                    Console.WriteLine();
                }
                Console.Write("{0:X2}  ", byteArray[i]);
                
            }
            Console.WriteLine();
            Console.WriteLine();
        }



    }


}
