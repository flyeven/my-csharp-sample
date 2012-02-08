using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Diagnostics;

using System.IO;
using System.Diagnostics;


using A0803_Excel.Model;
using A0803_Excel.Service;
using A0803_Excel.ServiceImpl;



namespace A0803_Excel
{
    class Program
    {

        static void Main(string[] args)
        {

            if (File.Exists("test1.xls"))
            {
                File.Delete("test1.xls");
            }

            // Excel 导出格式.
            ExcelDataExportFormater<TestData> format1 = new TestDataExcelExportFormater1();

            // Excel 异步导出处理
            AsynchronousExcelExportProcess<ExcelDataExportFormater<TestData>, TestData> exper =
                new AsynchronousExcelExportProcess<ExcelDataExportFormater<TestData>, TestData>();


            // 设置 格式化.
            exper.ExcelDataExportFormater = format1;

            // 设置输出文件.
            exper.OutputFileName = "test1.xls";


            // 开始异步处理.
            exper.StartAsynchronousProcess();



            // 模拟 分页数据读取.
            for (int i = 0; i < 10; i++)
            {
                // 队列加入数据.
                List<TestData> newList = GetTestData(i);
                exper.AddReportData(newList);
 
            }

            // 结束异步处理.
            exper.FinishAsynchronousProcess();


            Console.ReadLine();


            
        }




        private static List<TestData> GetTestData(int index)
        {
            Console.WriteLine("获取数据{0} AT {1}", index, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));


            List<TestData> resultList = new List<TestData>();


            for (int i = 0; i < index; i++)
            {

                TestData result = new TestData();

                result.UserName = "User" + index;
                result.City = "City" + index;
                result.Zip = "Zip" + index;


                resultList.Add(result);
            }



            // 模拟长时间处理
            Thread.Sleep(1000);

            return resultList;
        }

    }
}
