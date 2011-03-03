﻿using System;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace A0303_ThreadSafe.Sample
{


    /// <summary>
    /// 这个例子 演示 使用 Monitor 来实现 线程 安全的操作。
    /// 
    /// 
    /// </summary>
    class ThreadSampleWithMonitor
    {
        /// <summary>
        /// 简单的 线程执行的 方法.
        /// 
        /// 这个方法不是 静态的
        /// 
        /// 这个方法是 线程安全的。
        /// </summary>
        public void ThreadFunc(String keyword)
        {

            // 入口部分
            // 这里要求进入.
            Monitor.Enter(this);

            Console.WriteLine("线程{0}执行开始！", keyword);
            try
            {
                for (int i = 0; i < 60; i ++ )
                {
                    // 输出.
                    Console.Write(keyword);
                    Thread.Sleep(10);
                }
                Console.WriteLine();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                Console.WriteLine("线程{0}执行结束！", keyword);

                // 结束部分
                // 这里完成操作，允许其他线程执行上面的代码。
                Monitor.Exit(this);
            }
        }


        public void ThreadFuncA()
        {
            ThreadFunc("A");
        }

        public void ThreadFuncB()
        {
            ThreadFunc("B");
        }

    }
}
