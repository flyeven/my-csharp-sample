﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using A0300_Thread.Sample;

namespace A0300_Thread
{
    class Program
    {
        static void Main(string[] args)
        {
            // 静态线程方法的.
            StaticThreadSample.StartThread();

            // 普通线程方法的.
            ThreadSample.StartThread();

            Console.WriteLine("按 CTRL+C 结束操作！");
        }
    }
}
