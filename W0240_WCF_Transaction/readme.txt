��������:

���˲�����ǰ������ SQL Server ����� Test ���ݿ����棬����2�����Ա�  sql �ļ�Ϊ��Ŀ¼�µ� db.sql
�����û�� Test ���ݿ⣬��ô����һ����

================================================================================

1. ���� MyWcfServiceLibrary ��Ŀ�� 
1.1. ��Ŀ����Ϊ WCF �����
1.2. ��дһ�� WCF ����������������� 2 �ű� һ�� ���� һ���ӱ�
1.3. ���� WCF ���� ��Ҫ׷�ӵ�������Ϣ��
1.3.1.  �ӿڷ�������ǰ ����  [TransactionFlow(TransactionFlowOption.Allowed)]
1.3.2.  ʵ���� ǰ����   [ServiceBehavior(ConcurrencyMode = ConcurrencyMode.Single, InstanceContextMode = InstanceContextMode.PerCall, TransactionTimeout = "00:30:00" )] 
1.3.3.  ʵ���� ����ǰ ����  [System.ServiceModel.OperationBehavior(TransactionScopeRequired = true, TransactionAutoComplete = true)]



================================================================================

2. ���� MyWcfServiceClient ��Ŀ��
2.1. ��Ŀ���� ����̨Ӧ�ó���
2.2. ��Ŀ��� ���������á��� �������ں� �� �����֡� ��ť���д���
2.3. ��д Program.cs������ WCF ���� ����ģʽ�´����� app.config �� ������ VS2010 ���������²���ʹ�� ��
2.4. �������У� ע��˶� �������Ƿ��������ˡ�