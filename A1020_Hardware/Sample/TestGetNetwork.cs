using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Management;


namespace A1020_Hardware.Sample
{
    class TestGetNetwork
    {

        public static void DoTest()
        {
            // 网卡名.
            string networkAdapterCaption = null;

            ManagementClass processClass = new ManagementClass("Win32_NetworkAdapterConfiguration");
            ManagementObjectCollection moc = processClass.GetInstances();

            // 遍历所有的连接.
            foreach (ManagementObject mo in moc)
            {
                if (!(bool)mo.GetPropertyValue("IPEnabled"))
                {
                    // 如果没有IP 忽略掉.
                    continue;
                }
                if (mo.GetPropertyValue("DefaultIPGateway") == null)
                {
                    // 没有网关的，忽略掉.
                    continue;
                }
                // 取得网卡名.
                networkAdapterCaption = mo.GetPropertyValue("Caption").ToString();
            }
            if (String.IsNullOrEmpty(networkAdapterCaption))
            {
                Console.WriteLine("未检测到有效的网络连接!");
                return;
            }

            Console.WriteLine("网卡：{0}", networkAdapterCaption);
            // 连接名.
            string netConnectionID = null;
            processClass = new ManagementClass("Win32_NetworkAdapter");
            moc = processClass.GetInstances();
            // 遍历所有的网卡.
            foreach (ManagementObject mo in moc)
            {
                if (mo.GetPropertyValue("Caption").ToString() == networkAdapterCaption)
                {
                    netConnectionID = mo.GetPropertyValue("NetConnectionID").ToString();
                }
            }
            Console.WriteLine("网络连接名：{0}", netConnectionID);
        }

    }
}
