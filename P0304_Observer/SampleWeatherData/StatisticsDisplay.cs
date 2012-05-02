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
	public class StatisticsDisplay : IObserver, IDisplayElement
	{
		#region Members

		private float maxTemp = 0.0f;
		private float minTemp = 200;//set intial high so that minimum 
									//is set first invokation
		private float temperatureSum = 0.0f;
		private int numReadings = 0;
		
        /// <summary>
        /// �������
        /// </summary>
        private ISubject weatherData;


		#endregion//Members

		#region NumberOfReadings Property

		public int NumberOfReadings
		{
			get
			{
				return numReadings;
			}
		}

		#endregion//NumberOfReadings Property

		


        /// <summary>
        /// ���캯��.
        /// </summary>
        /// <param name="weatherData"></param>
		public StatisticsDisplay(ISubject weatherData)
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
			temperatureSum += temperature;
			numReadings++;

			if (temperature > maxTemp) 
			{
				maxTemp = temperature;
			}
 
			if (temperature < minTemp) 
			{
				minTemp = temperature;
			}
		}

		#endregion



		#region IDisplayElement Members


		public object Display()
		{
			return String.Format(
                    "ƽ��/���/��� �¶� = {0}F/ {1}F/ {2}F", 
                    RoundFloatToString(temperatureSum / numReadings) ,
				    maxTemp,
                    minTemp);
		}

		#endregion



		#region RoundFloatToString

		public static string RoundFloatToString(float floatToRound)
		{
			System.Globalization.CultureInfo cultureInfo = new System.Globalization.CultureInfo("en-US");
			cultureInfo.NumberFormat.CurrencyDecimalDigits = 2;
			cultureInfo.NumberFormat.CurrencyDecimalSeparator = ".";
			return floatToRound.ToString("F",cultureInfo);
		}
		#endregion//RoundFloatToString

	}
}
