����Ŀ�Ǵ� W0201_WCF_Detail ����ճ�������ġ�

����Ŀ��ҪĿ�������ڲ��� Ϊʹ��BasicHttpBing�󶨵ķ���ָ�����䰲ȫ 

����ų��� MyWCFService.Hosting ��Ŀ�� �Լ� MyWCFService.Client �е� ���� NetTcpBinding  �Ĵ��� �� ������Ϣ��



Ϊʹ��BasicHttpBing�󶨵ķ���ָ�����䰲ȫ 


================================================================================

�� MyWCFService.Web ��Ŀ��


����ȷ�� Web ��Ŀ��ʹ�� IIS Express �ģ� Ȼ���� Web ��Ŀ�������У� �и������� SSL �� ����Ϊ True.
��������Ժ󣬸���ֻ������ SSL URL �ĵ�ַ�������ʹ���ϡ�
Ŀǰ���Ի����ĵ�ַ�ǣ�
https://localhost:44300


1. ��Visual Studio��ʹ��WCF���ù����ߣ��� Web.config
	����WCF���ù����ߵ��������У����Binding��Ȼ�����ұߵ�"����һ���µİ�����" 

2. ��������Ϊ ServcieBasicHttpBindingConfig

3.�л���"��ȫ"��ǩ������ģʽΪ"Transport"�� 

4. ת������-->����-->�ս����
	ȷ��AddressΪ  https://localhost:44300/MyWCFService.svc
	��ѡ�������Ϊ "ServcieBasicHttpBindingConfig" 

5. ���������ļ����˳�WCF�������ù����ߣ�Ȼ��������Ŀ��ȷ��û�о���ʹ��� 

6. �� MyWCFService.Web ����Ϊ  ������Ŀ��  ���Է���  https://localhost:44300/MyWCFService.svc �� �鿴�Ƿ�����쳣��

����������������

����������н���system.serviceModel/serviceHostingEnvironment/multipleSiteBindingsEnabled������Ϊ true��
����Ҫ�ս��ָ����Ե�ַ��������ս����ָ��������� URI����õ�ַ�����Ǿ��Ե�ַ��
��Ҫ��������⣬��Ϊ�ս�㡰https://localhost:44300/MyWCFService.svc��ָ����� URI�� 
˵��: ִ�е�ǰ Web �����ڼ䣬����δ��������쳣�������ջ������Ϣ�����˽��йظô����Լ������е��´���ĳ�������ϸ��Ϣ�� 

�����޸� Web.config
<serviceHostingEnvironment multipleSiteBindingsEnabled="false" />



================================================================================

�� MyWCFService.Client ��Ŀ��

1. ѡ�� App.config �ļ��� Ȼ�� ����Ҽ��� �ڵ����˵���ѡ�� ���༭ WCF ���á�
    ���������Ҽ���û������˵�ѡ���ô���� ������˵��е� �����ߡ� --> ��WCF �������ñ༭����  ��

2. ѡ����Ǹ� BasicHttpBinding_ICalculator
	
3. �л���"��ȫ"��ǩ������ģʽΪ"Transport"�� 

4. ת�� �ͻ��� --> �˵��µ� BasicHttpBinding_ICalculator
	ȷ��AddressΪ https://localhost:44300/MyWCFService.svc   (Ҳ���� �� Web ��Ŀ�У����õĵ�ַ)
	��ѡ�������Ϊ "BasicHttpBinding_ICalculator" 

5. ���������ļ����˳�WCF�������ù����� 

6. �������С�



================================================================================

(�������Ĳ����� ��� �������Ѿ���װ��  IIS Express �� ��ô��������)

���û������
����Ŀͻ�������,������

�޷�Ϊ SSL/TLS ��ȫͨ����䷢������localhost:44300���������ι�ϵ��
������ ������Ҫ�����������������ò���!

1. �������д����£����� mmc  �� ������̨�� ����

2. �ڡ�����̨�� �����У��˵���ѡ�� "File��Add/Remove Snap-in"   ������  "�ļ�-���/ɾ������Ԫ"

3. �ڵ����� ����ӻ�ɾ������Ԫ��  �����У������õĹ���Ԫ�� ��ѡ��  ��֤�顱�� Ȼ�� ����ӡ� ��ť��

4. �� ��֤����� �����У� ѡ�� ��������ʻ���

5. �� ��ѡ�������� �����У� ѡ�� �����ؼ���������д˿���̨�ļ�������� �� Ȼ�� ����ɡ� ��ť��

6. �ص� ����ӻ�ɾ������Ԫ��  ���ڣ� �۲� �ұߵ� ����ѡ����Ԫ�� �У� �� ֤��(���ؼ����) �Ժ󣬰� ��ȷ���� ��ť�رմ��ڡ�

7. ����������̨������� ������̨���ڵ�-֤��(���ؼ����)-���ˡ���Ȼ��ѡ�� ��֤�顱������Է������ɵ�֤���Ѿ��������ұ���塣˫����֤�飬�Բ鿴��֤�����ϸ��Ϣ�� 

8. �л�����֤��� ����ϸ��Ϣ�� ��ǩҳ���϶��м�Ĺ��������ײ�������Է���"Thumbprint"���� �������� ��ָ�ơ��������Ƹ����Ե�ֵ����ÿ̨�������ֵ��һ������Ȼ��ر�֤�鴰�ڡ� 
   ���籾���Ի���ָ���ǣ� a2 ad 09 ab cf 53 03 cd d0 1c ae 90 7c 26 ba 7c 5f f5 e1 4b

9. �����з�ʽ�£�ִ���������

C:\>sqlcmd -S "localhost\SQLEXPRESS"
1> use test
2> go
�ѽ����ݿ������ĸ���Ϊ 'Test'��
1> select newid()
2> go
------------------------------------
4081ABF7-FE0C-49A6-B9B5-135144B3A03B
(1 ����Ӱ��)
1> exit

ע�����ϲ�����Ϊ�˻�ȡһ�� GUID

Ȼ����ִ�У�

netsh http add sslcert ipport=0.0.0.0:44300 certhash=a2ad09abcf5303cdd01cae907c26ba7c5ff5e14b appid={4081ABF7-FE0C-49A6-B9B5-135144B3A03B}



C:\>netsh http add sslcert ipport=0.0.0.0:44300 certhash=a2ad09abcf5303cdd01cae9
07c26ba7c5ff5e14b appid={4081ABF7-FE0C-49A6-B9B5-135144B3A03B}

δ����� SSL ֤�飬����: 5
����Ĳ�����Ҫ����(��Ϊ����Ա����)��

�� C:\Windows\System32 Ŀ¼�£� �ҵ�  cmd.exe  ����Ҽ���ѡ�� ���Թ���Ա������С�


C:\>netsh http add sslcert ipport=0.0.0.0:44300 certhash=a2ad09abcf5303cdd01cae9
07c26ba7c5ff5e14b appid={4081ABF7-FE0C-49A6-B9B5-135144B3A03B}

δ����� SSL ֤�飬����: 183
���ļ��Ѵ���ʱ���޷��������ļ���


��������ԭ�򣬿��������֤�飬�Ѿ��� IIS Express ��װ��ʱ��˳��һ��װ�õ��ˡ�
�����û�а�װ IIS Express�� ��ô��Ҫͨ��  makecert  �����һ��֤�飬 Ȼ����ͨ�������������Ӵ���


ע��
���� netsh ��ʹ�ã�������������ִ�� 
netsh ?
netsh http ?
netsh http add ?
netsh http add sslcert ?
���λ�ø��ְ�����Ϣ��



================================================================================


�� MyWCFService.Client ��Ŀ��

�޸�  Program.cs

�������ã�

using System.Security.Cryptography.X509Certificates;
using System.Net;


�����ࣺ

class PermissionCertificatePolicy
{
	string subjectName;
	static PermissionCertificatePolicy currentPolicy;

	PermissionCertificatePolicy(string subjectName)
	{
		this.subjectName = subjectName;
		ServicePointManager.ServerCertificateValidationCallback +=
		new System.Net.Security.RemoteCertificateValidationCallback(RemoveCertValidate);
	}

	public static void Enact(string subjectName)
	{
		currentPolicy = new PermissionCertificatePolicy(subjectName);
	}

	bool RemoveCertValidate(object sender, X509Certificate cert,
	X509Chain chain, System.Net.Security.SslPolicyErrors error)
	{
		if (currentPolicy.subjectName == subjectName)
			return true;
		return false;
	}
}



�� ����  CalculatorClient service = new CalculatorClient(endpointConfigurationName) ��ǰ�� ��ִ��һ�䣺

PermissionCertificatePolicy.Enact("CN=HTTPS-Server"); 






================================================================================

��һ���򻯲��ԣ�

����һ�� MyWCFService.Client_ByAuto ����̨��Ŀ��
���һ�� �������á� ��ַ���� https://localhost:44300/MyWCFService.svc
Ȼ���д���õĴ��롣

���Ҳ��ͬ������

�ڼ��� ����һ����ͬ���� ���� �� ���Ժ� 

��ִ�� 
PermissionCertificatePolicy.Enact("CN=HTTPS-Server"); 

������ܹ�������ִ���ˡ�