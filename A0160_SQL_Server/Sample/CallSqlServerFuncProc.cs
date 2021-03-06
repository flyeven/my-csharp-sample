﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace A0160_SQL_Server.Sample
{



    /// <summary>
    /// 用于 访问 SQL Server 数据库  函数 的例子。
    /// 
    /// 注意：这个例子所使用的 表 和 数据， 请参考项目下的 Schema.sql 文件。
    /// 
    /// </summary>
    class CallSqlServerFuncProc
    {

        /// <summary>
        /// SQL Server 的数据库连接字符串.
        /// </summary>
        private const String connString =
            @"Data Source=localhost\SQLEXPRESS;Initial Catalog=Test;Integrated Security=True";





        public void TestCallFuncProc()
        {
            // 建立数据库连接.
            SqlConnection conn = new SqlConnection(connString);

            // 打开连接.
            conn.Open();

            // 调用 SQL Server 函数.
            CallFunc(conn);

            // 调用 SQL Server 返回结果集的函数
            CallFuncWithTable(conn);

            // 调用存储过程
            CallProcedure(conn);

            // 调用存储过程  返回结果集
            CallProcedureWithReturnData(conn);

            // 关闭数据库连接.
            conn.Close();

        }






        /// <summary>
        /// 测试 调用 SQL Server 函数.
        /// </summary>
        private void CallFunc(SqlConnection conn)
        {
            // 创建一个 Command.
            SqlCommand testCommand = conn.CreateCommand();

            // 定义需要执行的SQL语句.
            testCommand.CommandText = "SELECT dbo.HelloWorldFunc()";

            // 执行SQL命令，结果存储到Reader中.
            SqlDataReader testReader = testCommand.ExecuteReader();

            // 处理检索出来的每一条数据.
            while (testReader.Read())
            {
                // 将检索出来的数据，输出到屏幕上.
                Console.WriteLine("调用函数:{0}; 返回:{1}",
                    testCommand.CommandText, testReader[0]
                    );
            }

            // 关闭Reader.
            testReader.Close();
        }


        /// <summary>
        /// 测试 调用 SQL Server 返回结果集的函数.
        /// </summary>
        private void CallFuncWithTable(SqlConnection conn)
        {
            // 创建一个 Command.
            SqlCommand testCommand = conn.CreateCommand();

            // 定义需要执行的SQL语句.
            testCommand.CommandText = "select * from getHelloWorld()";

            // 执行SQL命令，结果存储到Reader中.
            SqlDataReader testReader = testCommand.ExecuteReader();

            // 处理检索出来的每一条数据.
            while (testReader.Read())
            {
                // 将检索出来的数据，输出到屏幕上.
                Console.WriteLine("调用函数:{0}; 返回:{1} - {2}",
                    testCommand.CommandText, testReader[0], testReader[1]
                    );
            }

            // 关闭Reader.
            testReader.Close();
        }



        /// <summary>
        /// 测试执行存储过程.
        /// </summary>
        /// <param name="conn"></param>
        private void CallProcedure(SqlConnection conn)
        {
            // 创建一个 Command.
            SqlCommand testCommand = conn.CreateCommand();

            // 定义需要执行的SQL语句.
            testCommand.CommandText = "HelloWorld2";

            // 定义好，本次执行的类型，是存储过程.
            testCommand.CommandType = CommandType.StoredProcedure;

            // 定义要查询的参数.
            // 第一个参数，是输入的.
            testCommand.Parameters.Add(new SqlParameter("@UserName", "HeiHei"));

            // 第2个参数，是输出的.
            SqlParameter para2 = new SqlParameter("@OutVal",  SqlDbType.VarChar, 10);
            para2.Direction = ParameterDirection.Output;
            testCommand.Parameters.Add(para2);

            // 第3个参数，是既输入又输出的.
            SqlParameter para3 = new SqlParameter("@InoutVal",  SqlDbType.VarChar, 20);
            para3.Direction = ParameterDirection.InputOutput;
            para3.Value = "HAHA";
            testCommand.Parameters.Add(para3);

            // ExecuteNonQuery 方法，表明本次操作，不是一个查询的操作。将没有结果集合返回.
            // 返回的数据，将是 被影响的记录数.
            int insertRowCount = testCommand.ExecuteNonQuery();


            // 存储过程执行完毕后，取得 output 出来的数据.
            String pa2 = testCommand.Parameters["@OutVal"].Value.ToString();
            String pa3 = testCommand.Parameters["@InoutVal"].Value.ToString();

            Console.WriteLine("调用 {0} 存储过程之后， @OutVal={1}; @InoutVal={2}", testCommand.CommandText, pa2, pa3);

        }



        /// <summary>
        /// 测试执行存储过程. 返回结果集合.
        /// </summary>
        /// <param name="conn"></param>
        private void CallProcedureWithReturnData(SqlConnection conn)
        {
            // 创建一个 Command.
            SqlCommand testCommand = conn.CreateCommand();

            // 定义需要执行的SQL语句.
            testCommand.CommandText = "testProc";

            // 定义好，本次执行的类型，是存储过程.
            testCommand.CommandType = CommandType.StoredProcedure;

            // 执行SQL命令，结果存储到Reader中.
            SqlDataReader testReader = testCommand.ExecuteReader();

            // 处理检索出来的每一条数据.
            while (testReader.Read())
            {
                // 将检索出来的数据，输出到屏幕上.
                Console.WriteLine("调用函数:{0}; 返回:{1} - {2}",
                    testCommand.CommandText, testReader[0], testReader[1]
                    );
            }

            // 关闭Reader.
            testReader.Close();
        }


    }
}
