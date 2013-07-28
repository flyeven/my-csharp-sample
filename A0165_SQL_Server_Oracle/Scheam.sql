

-- ����Ŀ���ڲ���, Oracle �� SQL Server ��������.
-- ���ȣ� SQL Server ����һ���洢����  test_SqlServer_Proc��  Oracle ����һ���洢����  test_Oracle_Proc  ��

-- ���Ե� Case��
-- Case 1:
--   ��� test_SqlServer_Proc ִ��ʧ�ܣ� �ع�.  test_Oracle_Proc ����ִ�С�

-- Case 2:
--   ��� test_SqlServer_Proc ִ�гɹ��� test_Oracle_Proc ִ��ʧ�ܣ� �ع� ��Oracle �� SQL Server ���ع�����.

-- Case 3:
--   ��� test_SqlServer_Proc ִ�гɹ��� test_Oracle_Proc ִ�гɹ��� �ύ�޸�.



-------------------------------------------------
-- Orcle �ı���洢����.
-------------------------------------------------
CREATE TABLE Test_Trans (
  id   INT,
  val  INT
);


CREATE OR REPLACE PROCEDURE test_Oracle_Proc (
  p_param  INT
) AS
BEGIN
  -- ���Ȳ���һ��
  INSERT INTO Test_Trans (id, val) VALUES(1, p_param);
  -- ������� = 0�� ��ô���쳣.
  -- ���ڲ��� ������
  IF p_param = 0 THEN
    RAISE_APPLICATION_ERROR(-20000, '���Դ洢���̷������쳣!');
  END IF; 
END test_Oracle_Proc;
/


-------------------------------------------------
-- SQL Server �ı���洢����
-------------------------------------------------
CREATE TABLE  Test_Trans (
  id   INT,
  val  INT
);
GO



CREATE PROCEDURE test_SqlServer_Proc
  @Param INT
AS
BEGIN
  -- ���Ȳ���һ��
  INSERT INTO Test_Trans (id, val) VALUES(1,  @Param);
  
  -- ������� = 0�� ��ô���쳣.
  -- ���ڲ��� ������
  IF @Param = 0
  BEGIN
    RAISERROR('���Դ洢���̷������쳣��', 16, 1);
  END;
END;
go

