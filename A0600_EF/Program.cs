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
	}
}
