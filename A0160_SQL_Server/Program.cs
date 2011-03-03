using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using A0160_SQL_Server.Sample;

namespace A0160_SQL_Server
{
    class Program
    {
        static void Main(string[] args)
        {
            // 读
            ReadSqlServerData reader = new ReadSqlServerData();
            reader.ReadDataToDataSet();
            reader.ReadDataByReader();


            // 写
            WriteSqlServerData writer = new WriteSqlServerData();
            writer.TestInsertUpdateDelete();


            // 函数/存储过程.
            CallSqlServerFuncProc caller = new CallSqlServerFuncProc();
            caller.TestCallFuncProc();


            Console.ReadLine();

        }
    }
}

