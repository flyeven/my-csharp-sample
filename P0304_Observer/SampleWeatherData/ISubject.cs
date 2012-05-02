using System;

namespace DesignPatterns.Observer.WeatherData
{

    /// <summary>
    /// �۲���ģʽ�е�  �������⣨Subject����ɫ
    /// 
    /// �����ɫ�����еĹ۲��߶�������ñ�����һ���б��
	/// ÿ�����ⶼ�������κ������Ĺ۲��ߡ�
	/// �����ṩһ���ӿڿ��Լ��ϻ����۲��߶��������ɫ�ֽ������󱻹۲���(Observable)��ɫ�� 
    /// ���������ɫ����ʱ�ֽ������󱻹۲��߽�ɫ��������һ�����������һ���ӿ�ʵ�֣��ھ���������Ҳ���ų�ʹ�þ�����ʵ�֡�
    /// 
    /// </summary>
	public interface ISubject
	{
        /// <summary>
        /// ����һ�� �۲���
        /// </summary>
        /// <param name="o"></param>
		void RegisterObserver(IObserver o);

        /// <summary>
        /// �Ƴ�һ�� �۲���.
        /// </summary>
        /// <param name="o"></param>
		void RemoveObserver(IObserver o);


        /// <summary>
        /// ֪ͨ�۲��ߡ�
        /// </summary>
		void NotifyObserver();
	}
}
