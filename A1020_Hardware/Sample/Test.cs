using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Management;

namespace A1020_Hardware.Sample
{
    public class Test
    {

        public static void ShowHardwareInfo(string keyInfo)
        {

            Console.WriteLine("获取 {0} 的信息...", keyInfo);

            // Get the WMI class
            ManagementClass processClass = new ManagementClass(keyInfo);

            ManagementObjectCollection moc = processClass.GetInstances();

            foreach (ManagementObject mo in moc)
            {
                Console.WriteLine(
                    mo.GetText(TextFormat.Mof));
            }
        }


    }
}
