using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using A0190_MongoDB.Sample;


namespace A0190_MongoDB
{
    class Program
    {
        static void Main(string[] args)
        {

            // 基础的测试.
            //TestMongoBasic testMongoBasic = new TestMongoBasic();
            //testMongoBasic.DoTest();



            // LINQ 查询的测试.
            //TestMongoLinq testMongoLinq = new TestMongoLinq();
            //testMongoLinq.DoTest();




            // 复制集的测试.
            TestMongoReplSet testMongoReplSet = new TestMongoReplSet();
            testMongoReplSet.DoTest();


            //Console.ReadLine();

        }
    }
}
