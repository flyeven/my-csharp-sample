using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using A0151_Excel.Sample;

namespace A0151_Excel
{
    class Program
    {
        static void Main(string[] args)
        {

            string excelFileName = System.AppDomain.CurrentDomain.BaseDirectory + "Test.xls";
            CreateWriteExcel cwExcel = new CreateWriteExcel();
            cwExcel.TestWriteExcel(excelFileName);



            ReadExcel rExcel = new ReadExcel();
            rExcel.TestRead(excelFileName, String.Empty);



            rExcel.TestRead("Report.xls", "A4:C100");


            Console.ReadLine();
        }
    }
}
