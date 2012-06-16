using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using A0600_EF.Sample;

namespace A0600_EF
{
	class Program
	{
		/// <summary>
		/// SQL Server 的数据库连接字符串.
		/// </summary>
		private const String connString =
			@"metadata=.\Sample\Test.csdl|.\Sample\Test.ssdl|.\Sample\Test.msl;
provider=System.Data.SqlClient;
provider connection string='Data Source=localhost\SQLEXPRESS;Initial Catalog=Test;Integrated Security=True'";

		static void Main(string[] args)
		{
            // 基本功能测试
            BaseTest();

            // 事务处理的测试
            TransactionTest();


            // 动态查询的测试.
            IQueryableTest(null, null);
            IQueryableTest(1, null);
            IQueryableTest(null, "ONE");
            IQueryableTest(1, "ONE");


            Console.ReadLine();
        }



        /// <summary>
        /// 基本的 查询 / 插入 / 更新 / 删除 处理.
        /// </summary>
        private static void BaseTest()
        {
			TestContext context = new TestContext(connString);
			// 单表查询
			var query =
				from testMain in context.test_main
				select testMain;
			foreach (test_main main in query)
			{
				Console.WriteLine("Main[{0}, {1}]", main.id, main.value);
			}

			// 关联查询
			var query2 =
				from testSub in context.test_sub
				where testSub.test_main.value == "ONE"
				select testSub;
			foreach (test_sub sub in query2)
			{
				Console.WriteLine("Sub[{0}, {1}]", sub.id, sub.value);
			}

			// 插入.
			test_main main3 = new test_main();
			main3.id = 3;
			main3.value = "Three";
			context.AddObject("test_main", main3);
			context.SaveChanges();

			Console.WriteLine("INSERT FINISH!");
			Console.ReadLine();

			// 更新.
			var newTestMain =
				(from testMain in context.test_main
				 where testMain.id == 3
				 select testMain).First();
			newTestMain.value = "Three3";
			context.SaveChanges();

			Console.WriteLine("UPDATE FINISH!");
			Console.ReadLine();

			// 单表查询 TOP 2
			var queryTop2 =
				(from testMain in context.test_main
				 orderby testMain.id descending
				 select testMain).Take(2);

			foreach (test_main main in queryTop2)
			{
				Console.WriteLine("Main[{0}, {1}]", main.id, main.value);
			}

			// 删除.
			context.DeleteObject(newTestMain);
			context.SaveChanges();

			Console.WriteLine("DELETE FINISH!");
			Console.ReadLine();
		}




        /// <summary>
        /// 事务处理测试.
        /// </summary>
        private static void TransactionTest()
        {

            TestContext context = new TestContext(connString);


            // 插入.
            test_main main3 = new test_main();
            main3.id = 3;
            main3.value = "Three";
            context.AddObject("test_main", main3);

            // 插入.
            test_main main4 = new test_main();
            main4.id = 3;
            main4.value = "Three 4";
            context.AddObject("test_main", main4);

            try
            {
                context.SaveChanges();
            }
            catch (Exception err)
            {
                Console.WriteLine(err.ToString());
            }

            // 单表查询
            var query =
                from testMain in context.test_main
                where testMain.id == 3
                select testMain;


            Console.WriteLine("TestMain 表中， id=3 的记录有{0}条 ", query.Count());


        }






        /// <summary>
        /// 用于 动态的查询处理.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="val"></param>
        private static void IQueryableTest(int? id, string val)
        {
            // 如果 用户只输入了 id， 那么 只 where id = ?
            // 如果 用户只输入了 val， 那么 只 where value = ?
            // 如果 用户 id 和 val 都输入了， 那么 where  id=? and value = ?
            // 如果 用户 id 和 val 都没输入， 那么 where 也不需要了.

            Console.WriteLine("传入的参数：id={0}, val={1}", id, val);


            TestContext context = new TestContext(connString);


            IQueryable<test_main> result = context.test_main;

            if (id != null)
            {
                result = result.Where(c => c.id == id);
            }
            if (val != null)
            {
                result = result.Where(c => c.value == val);
            }

            foreach (test_main data in result)
            {
                Console.WriteLine("Main[{0}, {1}]", data.id, data.value);
            }
        }





	}
}
