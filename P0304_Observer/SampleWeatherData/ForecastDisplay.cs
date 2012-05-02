using System;
using System.Text;

namespace DesignPatterns.Observer.WeatherData
{

    /// <summary>
    /// �۲���ģʽ�е� ����۲��ߣ�ConcreteObserver����ɫ
    /// ����һ��ָ����������������ã���һ���������״̬�����״̬��
    /// ����۲��߽�ɫʵ�ֳ���۲��߽�ɫ��Ҫ��ĸ����Լ��Ľӿڣ��Ա�ʹ�����״̬�������״̬��ǡ�� 
    /// ����۲��߽�ɫ��ͨ����һ����������ʵ�֡�
    /// </summary>
	public class ForcastDisplay : IObserver, IDisplayElement
    {
        #region Members

        private float currentPressure = 29.92f;  
		private float lastPressure;


        /// <summary>
        /// �������
        /// </summary>
		private ISubject weatherData;


        #endregion


        /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="weatherData"></param>
        public ForcastDisplay(ISubject weatherData)
		{
            // ���� �������
			this.weatherData = weatherData;

            // ��������� ע��۲���.
            // Ҳ���ǵ� ������� �������仯�ˣ�֪ͨ��ǰ�����.
			weatherData.RegisterObserver(this);
		}




		#region IObserver Members


        /// <summary>
        /// ������������ݱ仯�� ֪ͨ��ǰ�����ʱ�� �����ñ�����.
        /// </summary>
        /// <param name="temperature"></param>
        /// <param name="humidity"></param>
        /// <param name="pressure"></param>
		public void Update(float temperature, float humidity, float pressure)
		{
			lastPressure = currentPressure;
			currentPressure = pressure;
		}


		#endregion



		#region IDisplayElement Members

		public object Display()
		{
			StringBuilder sb = new StringBuilder();

			sb.Append("Forecast: ");
			
			if(currentPressure > lastPressure) 
			{
				sb.Append("Improving weather on the way!");
			}
			else if (currentPressure == lastPressure)
			{
				sb.Append("More of the same");
			} 
			else if (currentPressure < lastPressure)
			{
				sb.Append("Watch out for cooler, rainy weather");
			}
			return sb.ToString();
		}

		#endregion
	}
}
