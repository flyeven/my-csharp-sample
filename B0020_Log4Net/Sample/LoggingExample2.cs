using System;


namespace B0020_Log4Net.Sample
{

	/// <summary>
	/// log4net ����.
	/// </summary>
	public class LoggingExample2
	{
        /// <summary>
        /// logʵ��.
        /// </summary>
        private static log4net.ILog log = log4net.LogManager.GetLogger("LoggingExample2");

        

		/// <summary>
		/// ���� Log.
		/// </summary>
		public void TestLog()
		{
            // ���� INFO ����� LOG.
            if (log.IsInfoEnabled)
            {
                log.Info("�����һ�� INFO �������־: ���Կ�ʼ��");
            }

            // ���� DEBUG ����� LOG
            if (log.IsDebugEnabled)
            {
                log.Debug("�����һ�� DEBUG �������־.");            
            }


            // ���� WARN ����� LOG
            log.Warn("�����һ�� WARN �������־.");


            // ���� ERROR ����� LOG
			try
			{
                MainFunc();
			}
			catch(Exception ex)
			{
				// �������쳣.
                log.Error("�����һ�� ERROR �������־���������쳣��", ex);
			}


            // ���� INFO ����� LOG.
            if (log.IsInfoEnabled)
            {
                log.Info("�����һ�� INFO �������־: ���Խ�����");
            }

			Console.Write("��������˳�...");
			Console.ReadLine();
		}


		
        /// <summary>
        /// ������.
        /// </summary>
		private void MainFunc()
		{
            SubFunc();
		}

        /// <summary>
        /// �ӷ���.
        /// </summary>
        private void SubFunc()
        {
            try
            {
                DBAccess();
            }
            catch (Exception ex)
            {
                throw new ArithmeticException("�ڵ��� DBAccess �����з������쳣��", ex);
            }
        }

        /// <summary>
        /// �������������ݿ����.
        /// </summary>
		private void DBAccess()
		{
            throw new Exception("DBAccess �������쳣��");
		}

		
	}
}
