using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;


using A0802_Excel.Model;
using A0802_Excel.Service;
using A0802_Excel.ServiceImpl;



namespace A0802_Excel
{

    class Program
    {



        static void Main(string[] args)
        {


            if (File.Exists("test1.xls"))
            {
                File.Delete("test1.xls");
            }

            if (File.Exists("test2.xls"))
            {
                File.Delete("test2.xls");
            }


            // 用于测试的数据列表.
            List<TestData> testDataList = new List<TestData>();

            testDataList.Add(new TestData { UserName = "用户1", City = "上海", Zip = "200000" });
            testDataList.Add(new TestData { UserName = "用户2", City = "桂林" });
            testDataList.Add(new TestData { UserName = "用户3" });



            ExcelDataExportFormater<TestData> format1 = new TestDataExcelExportFormater1();

            ExcelDataExportFormater<TestData> format2 = new TestDataExcelExportFormater2();



            // 数据导出到 Excel。
            ExcelExportProcess<ExcelDataExportFormater<TestData>, TestData> exper =
                new ExcelExportProcess<ExcelDataExportFormater<TestData>, TestData>();


            // 设置 格式化.
            exper.ExcelDataExportFormater = format1;
            // 导出.
            exper.CreateExcelReport(testDataList, "test1.xls");



            Debug.WriteLine("输出到 test1.xls 完毕！");
            


            // 设置 格式化.
            exper.ExcelDataExportFormater = format2;
            // 导出.
            exper.CreateExcelReport(testDataList, "test2.xls");


            Debug.WriteLine("输出到 test2.xls 完毕！");



            Console.ReadLine();
        }



    }
}
