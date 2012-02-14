﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.OleDb;


using A0803_Excel.Model;
using A0803_Excel.Service;


namespace A0803_Excel.ServiceImpl
{

    class TestDataExcelImportFormater1 : ExcelDataImportFormater<TestData>
    {


        List<TestData> ExcelDataImportFormater<TestData>.GetDataFromDataTable(DataTable dt)
        {
            // 结果列表.
            List<TestData> resultList = new List<TestData>();

            foreach (DataRow row in dt.Rows)
            {
                TestData myData = new TestData();
                myData.UserName = (String)row["用户名"];
                myData.City = (String)row["城市"];
                myData.Zip = (String)row["邮编"];

                resultList.Add(myData);
            }

            return resultList;
        }




        public TestData GetDataFromDataReader(OleDbDataReader reader)
        {

            TestData myData = new TestData();
            myData.UserName = (String)reader["用户名"];
            myData.City = (String)reader["城市"];
            myData.Zip = (String)reader["邮编"];

            return myData;
        }


    }
}
