using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using A002_OO.Sample;

namespace A002_OO
{
    class Program
    {
        static void Main(string[] args)
        {

            ISample sample1 = new Sample1();
            sample1.SayHello("小明");


            ISample sample2 = new Sample2();
            sample2.SayHello("Mike");


            ISample sample3 = new Sample3();
            sample3.SayHello("山本桑");


            Console.WriteLine("==== new 关键字 测试 ===");

            AbstractSample sample3a = new Sample3();
            sample3a.SayHello("山本桑");
            sample3a.SayEnd();

            Sample3 sample3b = new Sample3();
            sample3b.SayHello("山本桑");
            sample3b.SayEnd();



            Console.ReadLine();
        }
    }
}
