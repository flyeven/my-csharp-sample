��������:

================================================================================

1. ���� MyWCFService.Contract ��Ŀ�� 
1.1. ��Ŀ����Ϊ DLL��
1.2. ����Ŀ���� System.Runtime.Serialization �� System.ServiceModel �����á�
1.3. ɾ������Ŀ����ʱ���Զ��������Ǹ� Class1.cs

1.4. ����һ���� DivResult
1.5. Ϊ������ ���ԵĶ���
1.6. �ඨ��ǰ������ [DataContract] ��  ���Զ���ǰ������ [DataMember]��

1.7. ����һ���ӿ� ICalculator.cs
1.8. Ϊ�ӿ����� �����Ķ���
1.9. �ӿڶ���ǰ������ [ServiceContract] �� �ӿڷ�������ǰ������ [OperationContract] ��


�˲���ִ����Ϻ��൱����Ŀ�Ŀ���Ѿ�����á� 
����˵Ĵ��룬Ŀ���� ʵ�ֽӿڡ�
�ͻ��˵Ĵ��룬�ǵ��ýӿڵķ�����


================================================================================

2. ���� MyWCFService.Service ��Ŀ��
2.1. ��Ŀ����Ϊ DLL��
2.2. ����Ŀ�������á� ����  MyWCFService.Contract ��Ŀ�� 
2.3. ����Ŀ����ʱ���Զ��������Ǹ� Class1.cs������Ϊ CalculatorService.cs
2.4. �޸� CalculatorService.cs�� ������࣬ ʵ�� ǰ�沽�� 1.7. �������Ǹ� �ӿڡ�


�˲���ִ����Ϻ��൱����Ŀ�ķ���˴����Ѿ�������ϡ� 
��� ������������� MyWCFService.Service ��Ŀ����д ��Ԫ���ԵĴ��롣
���������ں��� WCF �ͻ��� ���� WCF ����˵ĳ����ʱ����С�ų�����ķ�Χ��

================================================================================

3. ���� MyWCFService.Hosting ��Ŀ��
3.1. ��Ŀ���� ����̨Ӧ�ó���
3.2. ����Ŀ�������á� ����  MyWCFService.Contract ��Ŀ �� MyWCFService.Service ��Ŀ�� 
3.3. ����Ŀ���� System.ServiceModel �����á�
3.4. ����Ŀ����һ�� ��Ӧ�ó��������ļ��� ��Ҳ���� App.config��
3.5. �޸� App.config ,���� <system.serviceModel> ��һ���׵�������Ϣ.
3.6. �޸� Program.cs
3.7. ��������.



�˲���ִ����Ϻ��൱��һ�� ���������� WCF ���������Ѿ����ϡ�
�����������ʹ�� netTcpBinding�� ����ı����� ������ ��ʽ����ġ�

���� Binding ��Ϣ���ɲο���
http://msdn.microsoft.com/zh-cn/library/ms730879.aspx


�������ϵͳ�� Client / Server �ķ�ʽ���ھ������������ģ���ô����һ���� Server �Ŀ������ù����Ѿ�������ɡ�



================================================================================

4. ���� MyWCFService.Web ��Ŀ
4.1. ��Ŀ���� ASP.NET �� Web Ӧ�ó���
4.2. ����Ŀ�������á� ����  MyWCFService.Contract ��Ŀ �� MyWCFService.Service ��Ŀ�� 
4.3. ����Ŀ���� System.ServiceModel �����á�
4.4. ����һ��  WCF����   MyWCFService.svc
4.5. ɾ�����Զ�����������  IMyWCFService.cs  ��  MyWCFService.svc.cs
4.6. �޸� MyWCFService.svc �ļ���  �޸� Service ���֣�  ɾ�� CodeBehind ���֡�
4.7. �޸���Ŀ�� ʹ�� IIS Express
4.8. ��������.


�˲���ִ����Ϻ��൱��һ�� ����Web�� WCF ���������Ѿ����ϡ�
�����������ʹ�� basicHttpBinding�� ����ı����� �ı� ��ʽ����ġ�

���� Binding ��Ϣ���ɲο���
http://msdn.microsoft.com/zh-cn/library/ms730879.aspx


�������ϵͳ�� Browser/Server �ķ�ʽ������ ������ Client / Server �ڹ������������ģ���ô����һ���� Server �Ŀ��������Ѿ�������ɡ� ( ���û�û���� )




================================================================================
5. ���� MyWCFService.Client ��Ŀ
5.1. ��Ŀ���� ����̨Ӧ�ó���
5.2. ����Ŀ�������á� ����  MyWCFService.Contract ��Ŀ   ( ע��: MyWCFService.Service ��Ŀ�Ͳ�Ҫ������) 
5.3. ����Ŀ����  System.Runtime.Serialization �� System.ServiceModel �����á�
5.4. ����Ŀ����һ�� ��Ӧ�ó��������ļ��� ��Ҳ���� App.config��
5.5. �޸� App.config ,���� <system.serviceModel> ��һ���׵�������Ϣ.
5.6. ����һ�� CalculatorClient.cs �ࡣ ʵ�� ClientBase<ICalculator>, ICalculator
5.7. ��д Program.cs�� �ֱ���� MyWCFService.Hosting �ϵ� WCF ���� ��  MyWCFService.Web �ϵ� WCF ����
5.8. �������� ������ǰ����Ҫ�ⲿ��ǰ���� �Ǹ� MyWCFService.Hosting.exe ��  �Լ� IIS Express ��ȷ������ Web ��



�˲���ִ����Ϻ��൱�� WCF �ͻ��˴��� �Ѿ� �ɹ��ص��� WCF ����ˡ�


