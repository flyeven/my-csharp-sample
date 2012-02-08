using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using System.Data;
using System.Threading;


namespace A0803_Excel.Service
{


    /// <summary>
    /// 异步 Excel 报表导出处理类.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class AsynchronousExcelExportProcess<T1, T2>
        where T1 : ExcelDataExportFormater<T2>
              
    {

        /// <summary>
        /// 基准的定义得对象.
        /// </summary>
        public T1 ExcelDataExportFormater { set; get; }

        /// <summary>
        /// 导出的 Excel 文件名称.
        /// </summary>
        public string OutputFileName { set; get; }





        /// <summary>
        /// 处理结束标志.
        /// 消费线程 不能通过 队列是否为空， 来判断程序结束
        /// 只能通过标志位来判断.
        /// </summary>
        private bool finishResult = false;


        /// <summary>
        /// 用于 锁定 生产 / 消费 的数据队列 的对象.
        /// </summary>
        private object locker = new object();


        /// <summary>
        /// 生产 / 消费 的 数据队列.
        /// </summary>
        private Queue<T2> dataQueue = new Queue<T2>();






        /// <summary>
        /// 创建 Excel 报表.
        /// </summary>
        /// <param name="dataList"></param>
        /// <param name="outputFileName"></param>
        private void CreateExcelReport()
        {

            // 取得连接字符串.
            String sConnectionString =
                Common.GetOleDbConnectionString(OutputFileName);

            // 定义 Oledb 的数据库联接.
            OleDbConnection cn = new OleDbConnection(sConnectionString);


            try
            {
                // 打开连接.
                cn.Open();
                // 首先建表.
                string sqlCreate = ExcelDataExportFormater.GetCreateTableSql();


                // 仅仅当 GetCreateTableSql() 函数返回的字符串
                // 非空的情况下， 才执行
                // 如果返回为空，那么可以认为是目标 Excel 已经有这个表
                // 不需要重复创建了.
                if (!String.IsNullOrEmpty(sqlCreate))
                {
                    OleDbCommand cmd = new OleDbCommand(sqlCreate, cn);
                    // 创建Sheet.
                    cmd.ExecuteNonQuery();
                }


                // 然后插入行.
                OleDbCommand icmd = new OleDbCommand();
                icmd.Connection = cn;
                icmd.CommandText = ExcelDataExportFormater.GetInsertSql();


                // 准备写到 Excel 当中的数据.
                List<T2> dataList = new List<T2>();


                while (true)
                {
                    // 需要确保 lock 代码段里面的代码
                    // 尽可能仅仅用于 队列数据的判断与获取
                    // 获取数据以后的业务处理逻辑，放到 lock 代码段以外.
                    lock (locker)
                    {
                        if (this.dataQueue.Count == 0)
                        {
                            // 如果 队列为空.
                            if (finishResult)
                            {
                                // 如果执行结束了.
                                // 退出循环.
                                break;
                            }
                            // 等待通知.
                            Monitor.Wait(locker);
                        }


                        // 从 队列中获取数据， 加入处理列表.
                        while (dataQueue.Count > 0)
                        {
                            dataList.Add(dataQueue.Dequeue());
                        }

                    }


                    Console.WriteLine("写入{0}条数据到 Excel 中 AT {1}", dataList.Count, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));


                    // 将临时列表中的数据， 写入 Excel .
                    foreach (T2 oneData in dataList)
                    {
                        // 清空参数.
                        icmd.Parameters.Clear();

                        // 从对象获取参数数组.
                        OleDbParameter[] parameters =
                            ExcelDataExportFormater.GetInsertParameter(oneData);

                        // 遍历填写参数.
                        for (int i = 0; i < parameters.Length; i++)
                        {
                            icmd.Parameters.Add(parameters[i]);
                        }
                        // 执行数据库插入操作.
                        icmd.ExecuteNonQuery();
                    }

                    // 清空临时列表.
                    dataList.Clear();

                }
            }
            finally
            {
                // 执行完毕后，关闭连接.
                if (cn != null && cn.State == ConnectionState.Open)
                {
                    cn.Close();
                }
            }
        }







        /// <summary>
        /// 开始异步处理.
        /// </summary>
        public void StartAsynchronousProcess()
        {
            // 消费线程.
            Thread reader = new Thread(CreateExcelReport);
            reader.Start();
        }


        /// <summary>
        /// 结束异步处理.
        /// </summary>
        public void FinishAsynchronousProcess()
        {
            finishResult = true;
        }


        /// <summary>
        /// 加入报表数据.
        /// </summary>
        /// <param name="newData"></param>
        public void AddReportData(T2 newData)
        {
            lock (locker)
            {
                // 队列加入数据.
                dataQueue.Enqueue(newData);
                
                // 通知 其他等待的线程
                Monitor.Pulse(locker);
            }
        }


        /// <summary>
        /// 加入报表数据.
        /// </summary>
        /// <param name="newList"></param>
        public void AddReportData(List<T2> newList)
        {
            lock (locker)
            {
                // 队列加入数据.
                foreach (T2 oneData in newList)
                {
                    dataQueue.Enqueue(oneData);
                }
                // 通知 其他等待的线程
                Monitor.Pulse(locker);
            }
        }

    }



}
