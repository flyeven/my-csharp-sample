��ĿĿ��:

�� SQL Server �£�ʵ�� MySQL �� GROUP_CONCAT �����Ĺ���.




ִ�е�ǰ��
sp_configure 'clr enabled', 1 
GO 
RECONFIGURE 
GO 



Ȼ���� VS2010 ���棬����һ�� ��Visual C# SQL CLR ���ݿ���Ŀ��

Ȼ�󴴽� ���ۼ���.

��д����.

����ͨ������Ժ�
�ص�  SQL Server Management Studio �е� [�ɱ����] �µ� [����]�С�
�Ȱ��������õ� S0001_GROUP_CONCAT.dll  �ӽ�ȥ��



C# ��Ŀ��Ҫ�ǵ����� Ŀ����Ϊ .NET Framework 3.5
���ʹ��Ĭ�ϵ� .NET Framework 4�������޷��ɹ��İѱ���õ� DLL �ļ������� SQL Server 2008 ����ȥ��


�ڰѱ༭�õ� DLL �ļ������뵽���ݿ�ĳ���֮��
��ִ������� SQL ��䡣

-- �����ۼ�����.
CREATE AGGREGATE [dbo].[GROUP_CONCAT](@Value NVARCHAR(30))
 RETURNS NVARCHAR(MAX)
 EXTERNAL NAME [S0001_GROUP_CONCAT].[GROUP_CONCAT];



-- ģ�����.
CREATE TABLE TestTitle (
  name   VARCHAR(10),
  title  VARCHAR(20)
);


INSERT INTO TestTitle VALUES ('����', '����Ա');
INSERT INTO TestTitle VALUES ('����', 'ϵͳ����Ա');
INSERT INTO TestTitle VALUES ('����', '�������Ա');

INSERT INTO TestTitle VALUES ('����', '��Ŀ����');
INSERT INTO TestTitle VALUES ('����', 'ϵͳ����Ա');

INSERT INTO TestTitle VALUES ('����', 'ϵͳ����Ա');
GO


SELECT
  name,
  Convert(nvarchar(30), dbo.GROUP_CONCAT(title)) AS allTitle
FROM
  TestTitle
GROUP BY
  name;
GO


ִ�н��.

name       allTitle
---------- ------------------------------
����         ��Ŀ����,ϵͳ����Ա
����         ϵͳ����Ա
����         ����Ա,ϵͳ����Ա,�������Ա

(3 ����Ӱ��)