using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyClient
{
    class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Web 服务 客户端代码");


            using (MyWebServiceReference.MyWebServiceSoapClient c = new MyWebServiceReference.MyWebServiceSoapClient())
            {
                Console.WriteLine("调用 服务端 HelloWorld 方法！ ");
                Console.WriteLine(c.HelloWorld());




                Console.WriteLine("调用 服务端 DoLogin 方法！ ");

                string userName = String.Empty;
                string password = String.Empty;
                string resultMessage = String.Empty;
                bool loginResult = c.DoLogin(userName, password, ref resultMessage);
                Console.WriteLine("调用 DoLogin ( '{0}' , '{1}' ), 返回值{2}, 返回消息{3}",
                    userName, password, loginResult, resultMessage);

                userName = "TEST";
                password = "123";
                resultMessage = String.Empty;
                loginResult = c.DoLogin(userName, password, ref resultMessage);
                Console.WriteLine("调用 DoLogin ( '{0}' , '{1}' ), 返回值{2}, 返回消息{3}",
                    userName, password, loginResult, resultMessage);

                userName = "TEST";
                password = "TEST";
                resultMessage = String.Empty;
                loginResult = c.DoLogin(userName, password, ref resultMessage);
                Console.WriteLine("调用 DoLogin ( '{0}' , '{1}' ), 返回值{2}, 返回消息{3}",
                    userName, password, loginResult, resultMessage);

            }




            Console.ReadLine();

        }
    }
}
