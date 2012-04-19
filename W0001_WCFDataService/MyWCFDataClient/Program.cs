using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyWCFDataClient
{
    class Program
    {
        static void Main(string[] args)
        {

            // Debug 阶段
            // 此地址可能需要动态的变化.
            Uri serviceRootUri = new Uri("http://localhost:4141/DemoWcfDataService.svc/");


            ServiceReference1.TestEntities service = 
                new ServiceReference1.TestEntities(serviceRootUri);


            // 这里是 使用 Linq  查询远程服务器上的表的数据。
            var query =
                from data in service.mr_demo_data
                where data.city_id == 1
                select data;


            foreach (ServiceReference1.mr_demo_data data in query)
            {
                Console.WriteLine(
                    "City:{0}; Dept{1}; Value{2}",
                    data.city_id,
                    data.dept_id,
                    data.demo_info);
            }

            Console.ReadLine();
        }
    }
}
