����Ŀ���� ʵ���� ��������ɶ�̬ SQL �Ĵ���.


������2���� һ���Ǳ����ƣ� һ���ǲ�ѯ����.


ִ�е�ǰ��
sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO



Ȼ���� VS2010 ���棬����һ�� ��Visual C# SQL CLR ���ݿ���Ŀ��
����һ������





д��C#�����Ժ�. ����ͨ������Ժ�
�ص�  SQL Server Management Studio �е� [�ɱ����] �µ� [����]�С�
�Ȱ��������õ� S0031_IsTableExists.dll �ӽ�ȥ��



C# ��Ŀ��Ҫ�ǵ����� Ŀ����Ϊ .NET Framework 3.5
���ʹ��Ĭ�ϵ� .NET Framework 4�������޷��ɹ��İѱ���õ� DLL �ļ������� SQL Server 2008 ����ȥ��


�ڰѱ༭�õ� DLL �ļ������뵽���ݿ�ĳ���֮��
��ִ������� SQL ��䡣

-- ��������.
CREATE FUNCTION [dbo].[IsTableExists]
(@tableName NVARCHAR (64), @queryInfo NVARCHAR (1000))
RETURNS INT
AS
  EXTERNAL NAME[S0031_IsTableExists].[UserDefinedFunctions].[IsTableExists]
go





ϵͳ�кܶ�� ����2��������ֶΡ����� Code1  �� Code2.
���2���ֶε�ֵ�������й�����ϵ�ġ�
������һ�����У� ֻ��Code1 �� û�� Code2 ���������

���仰˵����� Code1 �� Code2 �� Ҫô2����Ϊ NULL�� Ҫô2������ΪNULL.

�������ڳ�������Ĵ������ݿ���³��˵����⣬Ҫ��ʰ�о��ˡ�
��ô���أ�

������� Code1 �� Code2 ��ÿ�������棬ʵ�ʵ��ֶ���������һ��
���� 
��A�� ��  A_Code1 �� A_Code2
��B�� ��  B_Code1 �� B_Code2

-- ���Ա�
CREATE TABLE a  ( A_CODE1 INT, A_CODE2 INT);
CREATE TABLE b  ( B_CODE1 INT, B_CODE2 INT);

-- �������ݡ� a����ڷǷ�����.
INSERT INTO a VALUES( 1, null);
INSERT INTO b VALUES( 1, 1);

 

ͨ�� ���� sys.tables �� sys.columns ���ԱȽϷ���������ֹ�ϵ�ı�/�ֶζ�λ����

SELECT
  t.name AS TableName,
  c1.name AS Code1Name,
  c2.name AS Code1Name
FROM
  sys.tables t
    JOIN sys.columns c1 ON (t.object_id = c1.object_id AND c1.name LIKE '%Code1')
    JOIN sys.columns c2 ON (t.object_id = c2.object_id AND c2.name LIKE '%Code2')

TableName  Code1Name     Code1Name
---------- ------------- ---------
a          A_CODE1       A_CODE2
b          B_CODE1       B_CODE2

(2 ����Ӱ��)





SELECT
  Convert(varchar(10), t.name) AS TableName,
  Convert(varchar(10), c1.name) AS Code1Name,
  Convert(varchar(10), c2.name) AS Code1Name,
  dbo.[IsTableExists](
      t.name,
      c1.name + ' IS NOT NULL AND ' 
        + c2.name + ' IS NULL' ) AS [�Ƿ������������]
FROM
  sys.tables t
    JOIN sys.columns c1 ON (t.object_id = c1.object_id AND c1.name LIKE '%Code1')
    JOIN sys.columns c2 ON (t.object_id = c2.object_id AND c2.name LIKE '%Code2')
go


TableName  Code1Name  Code1Name  �Ƿ������������
---------- ---------- ---------- -----------
a          A_CODE1    A_CODE2              1
b          B_CODE1    B_CODE2              0

(2 ����Ӱ��)

