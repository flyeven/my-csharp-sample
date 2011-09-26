﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using A0185_MySQL_MySqlClient.Sample;

namespace A0185_MySQL_MySqlClient
{
    class Program
    {
        static void Main(string[] args)
        {

            // 读
            ReadMySQLData reader = new ReadMySQLData();
            reader.ReadDataToDataSet();
            reader.ReadDataByReader();


            // 写
            WriteMySQLData writer = new WriteMySQLData();
            writer.TestInsertUpdateDelete();


            Console.ReadLine();
        }
    }
}
