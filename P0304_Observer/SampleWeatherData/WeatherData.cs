using System;
using System.Collections.Generic;

namespace DesignPatterns.Observer.WeatherData
{


    /// <summary>
    /// �۲���ģʽ�е�  �������⣨ConcreteSubject����ɫ
    /// 
    ///   ����Ծ���۲��߶������õ��ڲ�״̬���������ڲ�״̬�ı�ʱ����۲��߷���һ��֪ͨ��
    ///   ���������ɫ�ֽ������屻�۲��߽�ɫ��
    ///   ���������ɫ��ͨ����һ����������ʵ�֡�  
    /// </summary>
	public class WeatherData : ISubject
	{
        /// <summary>
        /// �۲����б�.
        /// </summary>
        private List<IObserver> observers;


        #region �ڲ����ݵĲ���.

        /// <summary>
        /// �¶�
        /// </summary>
		private float temperature;

        /// <summary>
        /// ʪ��
        /// </summary>
		private float humidity;

        /// <summary>
        /// ����ѹ��
        /// </summary>
		private float pressure;


        #endregion



        /// <summary>
        /// ���캯����
        /// </summary>
        public WeatherData()
		{
            // ��ʼ��  �۲����б�
            observers = new List<IObserver>();
		}




        #region ISubject Members  ʵ�ֳ������⣨Subject����ɫ�� ����.


        /// <summary>
        /// ����һ�� �۲���
        /// </summary>
        /// <param name="o"></param>
        public void RegisterObserver(IObserver o)
		{
			observers.Add(o);
		}


        /// <summary>
        /// �Ƴ�һ�� �۲���.
        /// </summary>
        /// <param name="o"></param>
		public void RemoveObserver(IObserver o)
		{
			int i = observers.IndexOf(o);
			if(i >= 0)
			{
				observers.Remove(o);
			}
		}


        /// <summary>
        /// ֪ͨ�۲��ߡ�
        /// </summary>
		public void NotifyObserver()
		{
			foreach(IObserver observer in observers)
			{
				observer.Update(temperature,humidity,pressure);
			}
		}


		#endregion

		
        
        



        public void MeasurementsChanged()
		{
			NotifyObserver();
		}

        /// <summary>
        /// �޸����ݵķ���
        /// 
        /// </summary>
        /// <param name="temperature"></param>
        /// <param name="humidity"></param>
        /// <param name="pressure"></param>
		public void SetMeasurements(float temperature, float humidity,
			float pressure)
		{
			this.temperature = temperature;
			this.humidity = humidity;
			this.pressure = pressure;

            // �����޸���Ϻ� ֪ͨ�۲���
			MeasurementsChanged();
		}
	}
}
