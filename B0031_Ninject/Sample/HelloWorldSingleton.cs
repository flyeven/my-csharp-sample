using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


using B0030_Ninject.Sample;



namespace B0031_Ninject.Sample
{

    public class HelloWorldSingleton : IHelloWorld
    {

        
        #region 实现单例的代码.


        /// <summary>
        /// 私有构造函数.
        /// 不允许外部实例化.
        /// </summary>
        private HelloWorldSingleton()
        {
        }

        /// <summary>
        /// 内部私有静态实例.
        /// </summary>
        private static HelloWorldSingleton me;


        /// <summary>
        /// 外部获取单例的代码.
        /// </summary>
        /// <returns></returns>
        public static HelloWorldSingleton Instance()
        {
            if (me == null)
            {
                me = new HelloWorldSingleton();
            }

            return me;
        }


        #endregion




        string IHelloWorld.HelloWorld()
        {
            return "我是一个单例的 Hello World! ";
        }


    }
}
