����Ŀ���ڷ��غ��ֵ�ƴ������ĸ��(Ӣ�����ּ򵥷���)

ִ�е�ǰ��
sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO



Ȼ���� VS2010 ���棬����һ�� ��Visual C# SQL CLR ���ݿ���Ŀ��
����һ������




д��C#�����Ժ�. ����ͨ������Ժ�
�ص�  SQL Server Management Studio �е� [�ɱ����] �µ� [����]�С�
�Ȱ��������õ� S0021_GetPinYin.dll �ӽ�ȥ��


C# ��Ŀ��Ҫ�ǵ����� Ŀ����Ϊ .NET Framework 3.5
���ʹ��Ĭ�ϵ� .NET Framework 4�������޷��ɹ��İѱ���õ� DLL �ļ������� SQL Server 2008 ����ȥ��


�ڰѱ༭�õ� DLL �ļ������뵽���ݿ�ĳ���֮��
��ִ������� SQL ��䡣

-- ��������.
CREATE FUNCTION [dbo].[GetPinYin]
(@word NVARCHAR (100))
RETURNS NVARCHAR (100)
AS
  EXTERNAL NAME[S0021_GetPinYin].[UserDefinedFunctions].[GetPinYin]
go


-- ����
SELECT
  Convert(nvarchar(10), [dbo].[GetPinYin]('����')) A,
  Convert(nvarchar(10), [dbo].[GetPinYin]('����')) B,
  Convert(nvarchar(10), [dbo].[GetPinYin]('����')) C,
  Convert(nvarchar(10), [dbo].[GetPinYin]('����')) D,
  Convert(nvarchar(10), [dbo].[GetPinYin]('����123')) E,
  Convert(nvarchar(10), [dbo].[GetPinYin]('123Test')) F
GO

A          B          C          D          E          F
---------- ---------- ---------- ---------- ---------- ----------
ZS         LS         WW         ZL         CS123      123Test

(1 ����Ӱ��)
