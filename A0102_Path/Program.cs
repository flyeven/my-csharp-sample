using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace A0102_Path
{
    class Program
    {




        /// <summary>
        /// 本例子用于 演示 获取程序 当前路径的例子.
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {

            Console.WriteLine("System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName");
            Console.WriteLine(System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName);
            Console.WriteLine();


            Console.WriteLine("System.Environment.CurrentDirectory");
            Console.WriteLine(System.Environment.CurrentDirectory);
            Console.WriteLine();


            Console.WriteLine("System.IO.Directory.GetCurrentDirectory()");
            Console.WriteLine(System.IO.Directory.GetCurrentDirectory());
            Console.WriteLine();


            Console.WriteLine("System.AppDomain.CurrentDomain.BaseDirectory");
            Console.WriteLine(System.AppDomain.CurrentDomain.BaseDirectory);
            Console.WriteLine();

            Console.WriteLine("System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase");
            Console.WriteLine(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase);
            Console.WriteLine();


            Console.ReadLine();
        }


    }
}


/* 运行结果演示.

 
C:\Users\wangzhiqing>D:\MyTools\my-csharp-sample\A0102_Path\bin\Debug\A0102_Path.exe

System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName
D:\MyTools\my-csharp-sample\A0102_Path\bin\Debug\A0102_Path.exe

System.Environment.CurrentDirectory
C:\Users\wangzhiqing

System.IO.Directory.GetCurrentDirectory()
C:\Users\wangzhiqing

System.AppDomain.CurrentDomain.BaseDirectory
D:\MyTools\my-csharp-sample\A0102_Path\bin\Debug\

System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase
D:\MyTools\my-csharp-sample\A0102_Path\bin\Debug\


*/