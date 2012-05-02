using System;

namespace DesignPatterns.Observer.WeatherData
{


    /// <summary>
    /// �۲���ģʽ�е� ����۲��ߣ�Observer����ɫ
    /// 
    /// Ϊ���еľ���۲��߶���һ���ӿڣ��ڵõ�֪ͨʱ�����Լ��� 
    ///    ����۲��߽�ɫ��������һ�����������һ���ӿ�ʵ�֣��ھ���������Ҳ���ų�ʹ�þ�����ʵ�֡�  
    /// </summary>
    public interface IObserver
    {

        /// <summary>
        /// ���·�����
        /// </summary>
        /// <param name="temperature">�¶�</param>
        /// <param name="humidity">ʪ��</param>
        /// <param name="pressure">����ѹ��</param>
        void Update(float temperature, float humidity, float pressure);

    }
}
