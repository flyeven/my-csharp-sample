using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace A0650_EF_SqlServer.Sample
{
    /// <summary>
    /// 测试延迟加载.
    /// </summary>
    public class TestLazyLoading
    {
        /// <summary>
        /// 测试.
        /// </summary>
        public static void DoTest()
        {

            
            using (TestEntities context = new TestEntities())
            {
                Console.WriteLine("测试 使用 延迟加载！");

                // 使用 延迟加载.
                context.ContextOptions.LazyLoadingEnabled = true;

                // 这里主动查询 test_main
                foreach (test_main m in context.test_main.Where(p=>p.id < 100))
                {
             
                    Console.WriteLine("Main = {0}:{1}", m.id, m.value);

                    // 下面使用 延迟加载， 自动取查询 test_sub
                    if (m.test_sub != null)
                    {
                        foreach (test_sub s in m.test_sub)
                        {
                            Console.WriteLine("----- Sub = {0}:{1}", s.id, s.value);
                        }
                    }
                }
            }


            Console.WriteLine();
            using (TestEntities context = new TestEntities())
            {
                Console.WriteLine("测试 不使用 延迟加载！");
                // 不使用 延迟加载.
                context.ContextOptions.LazyLoadingEnabled = false;



                Console.WriteLine("普通方式查询 test_main！");
                // 这里主动查询 test_main
                foreach (test_main m in context.test_main.Where(p => p.id < 100))
                {

                    Console.WriteLine("Main = {0}:{1}", m.id, m.value);

                    if (m.test_sub != null)
                    {
                        // 注意：
                        //    使用 非延迟加载的， 结果不是 NULL, 是一个空白列表.
                        foreach (test_sub s in m.test_sub)
                        {
                            Console.WriteLine("----- Sub = {0}:{1}", s.id, s.value);
                        }
                    }
                    else
                    {
                        Console.WriteLine("m.test_sub  is  null...");
                    }
                }

                Console.WriteLine();
                Console.WriteLine("Include 方式查询 test_main！");
                // 这里使用 贪婪加载.
                foreach (test_main m in context.test_main.Include("test_sub").Where(p => p.id < 100))
                {

                    Console.WriteLine("Main = {0}:{1}", m.id, m.value);

                    if (m.test_sub != null)
                    {
                        foreach (test_sub s in m.test_sub)
                        {
                            Console.WriteLine("----- Sub = {0}:{1}", s.id, s.value);
                        }
                    }
                    else
                    {
                        Console.WriteLine("m.test_sub  is  null...");
                    }
                }



            }

        }
    }

}
