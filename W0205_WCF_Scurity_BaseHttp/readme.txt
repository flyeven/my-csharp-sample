����Ŀ�Ǵ� W0204_WCF_Scurity_BaseHttp ����ճ�������ġ�

����Ŀ��ҪĿ�������ڲ��� 

ʹ��BasicHttpBing�󶨵ķ���ָ�����䰲ȫ  �Լ� Windows ����ϵͳ��֤�Ĺ��ܡ�




================================================================================
��������


1. �ڱ�������ϣ�����һ���û� testwcf�� ����Ϊ testwcf12345�� ѡ�� �û����ܸ������� �� �����������ڡ�
2. �޸� testwcf ���û��飬 Ϊ Guests.  




================================================================================
MyWCFService.Web ��Ŀ
�޸� �󶨵İ�ȫ�Բ���
mode �޸�Ϊ TransportWithMessageCredential
clientCredentialType �޸�Ϊ Windows

================================================================================
MyWCFService.Client ��Ŀ
�޸� �󶨵İ�ȫ�Բ���
mode �޸�Ϊ TransportWithMessageCredential
clientCredentialType �޸�Ϊ Windows



================================================================================
�򵥲�������һ�£� ���Ϊ��

δ�ṩ�û��������� ClientCredential ��ָ���û�����

����Ԥ�ڽ���� ��Ϊ�ͻ���ȷʵû�д� �û���������Ĵ��롣


================================================================================
MyWCFService.Client ��Ŀ
�޸� CalculatorClient.cs

���캯������������Ӧ���룺

public CalculatorClient()
	: base()
{
	this.ClientCredentials.UserName.UserName = "testwcf";
	this.ClientCredentials.UserName.Password = "testwcf12345";
}

��������ͨ����


================================================================================
MyWCFService.Client_ByAuto ��Ŀ

ˢ��һ�� ��������
�ֶ��޸� app.config
�޸ĳɣ�
<security mode="TransportWithMessageCredential">
<transport clientCredentialType="Windows"



�޸� Program.cs

using (ServiceReference1.CalculatorClient service = new ServiceReference1.CalculatorClient("BasicHttpBinding_ICalculator"))
{
	service.ClientCredentials.UserName.UserName = "testwcf";
	service.ClientCredentials.UserName.Password = "testwcf12345";
	...
}

��������ͨ����


================================================================================
MyWCFService.Web ��Ŀ

��������

Windows �����֤ --> ������
���� �����֤ --> �ѽ���

�� MyWCFService.Web ��Ŀ �� Web.config �� <system.web> �У������������ã�


<!--  Windows ��֤. -->
<authentication mode="Windows">
</authentication>

<authorization>
  <deny users="?"/>
</authorization>    



================================================================================
����� Web ��Ŀ�� ����������һ̨�������ȥ���в���

Ŀ������ Win7.  
IP ��ַ 192.168.56.101


���Ȱ�װ .NET 4.0

Ȼ�� ��װ IIS 7.5
�������--����͹���
�򿪻�ر� Windows ����
Internet ��Ϣ����
-- ��ά������
---- ��ȫ�� ��ȫ���򹴣�

----------------------------------------

Ȼ��
����Ա������� cmd.exe

C:\Windows\Microsoft.NET\Framework\v4.0.30319>aspnet_regiis.exe /iru
��ʼ��װ ASP.NET (4.0.30319)��
.................
ASP.NET (4.0.30319)��װ��ϡ�

C:\Windows\Microsoft.NET\Framework\v4.0.30319>


----------------------------------------

IIS ������
ѡ����վ
�ұ߲�����  �༭��վ����� ����...��
��վ�󶨴����У� �� ����ӡ� ��ť��
ѡ�� https  ( ����2��ʹ��Ĭ��ֵ)
�ֶ�ѡ��һ�� SSL ֤��  ( ��͵���� �ɰ�װһ��  IIS Express 7.5  )


ѡ����վ�� ��� SSL ���ã� ѡ�� Ҫ�� SSL

ע��˶�һ�£� IIS ʹ�õ� Ӧ�ó���������  .NET �İ汾�� ��û�� .NET 4.0 ���ˡ�
ͬʱ�鿴��ǰ��վʹ�õ� ����أ��Ƿ��� .NET 4.0 �ġ�

----------------------------------------



�޸� ǰ�漸����Ŀ�е� �����ļ���  
Ҳ����  Web.Config  ��  App.Config

�� 
https://localhost:44300/MyWCFService.svc
�޸�Ϊ
https://192.168.56.101:443/MyWCFService.svc


Ȼ�� Web ��Ŀ������ 192.168.56.101 ��̨���Լ������ȥ��

�����ֱ�����  MyWCFService.Client ��  MyWCFService.Client_ByAuto
���гɹ���


Ȼ����� �������� ���룬 ������ʾ��֤ʧ�ܡ�
