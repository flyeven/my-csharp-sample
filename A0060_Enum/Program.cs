using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using A0060_Enum.Sample;

namespace A0060_Enum
{






    class Program
    {
        static void Main(string[] args)
        {

            EnumSample sample = new EnumSample();

            // 测试遍历 枚举的所有元素.
            sample.ViewAll();

            // 测试 解析字符串.
            sample.TestParse();


            // 测试通过 得到枚举的某一值对应的名称
            sample.TestGetName();

            Console.ReadLine();
        }
    }
}
