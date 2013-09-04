-- ������������. ID ������.
CREATE TABLE TestMain (
	Id      INT,
	Value   VARCHAR(10),
	PRIMARY KEY(Id) 
);


-- ���������ӱ�. 
CREATE TABLE TestSub (
	Id      INT,
	Main_id INT,
	Value   VARCHAR(10),
	PRIMARY KEY(Id) 
);


-- ���������������.
INSERT INTO TestMain(id, value) VALUES (1, 'ONE');
INSERT INTO TestMain(id, value) VALUES (2, 'TWO');

-- ��������ӱ�����.
INSERT INTO TestSub(id, main_id, value) VALUES (1, 1, 'ONEONE');
INSERT INTO TestSub(id, main_id, value) VALUES (2, 2, 'TWOTWO');


-- ���Լ��
ALTER TABLE TestSub ADD CONSTRAINT main_id_cons FOREIGN KEY (main_id) REFERENCES TestMain;






----------
--  Identity ����.
----------


-- �����ǰ���ݿ���,�Ѿ������б� test_Identity_tab, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_Identity_tab')  
  DROP TABLE test_Identity_tab
GO


-- �������Ա�. ID ������.  ���ݽ��� Identity ��ʽ����.
CREATE TABLE test_Identity_tab (
	id      INT  identity(1, 1),
	value   VARCHAR(10),
	PRIMARY KEY(id) 
);
GO


-- ���������ӱ�. 
CREATE TABLE test_Identity_tab_Sub (
	Id      INT  identity(1, 1),
	Main_id INT,
	Value   VARCHAR(10),
	PRIMARY KEY(Id) 
);


-- ���Լ��
ALTER TABLE test_Identity_tab_Sub ADD CONSTRAINT fk_Identity_Sub_M FOREIGN KEY (main_id) REFERENCES test_Identity_tab;









-- ���Ժ���
CREATE FUNCTION HelloWorldFunc()
RETURNS VARCHAR(20)
AS
BEGIN
  RETURN 'Hello World!';
END
go


-- ���Է��ؽ��������
CREATE FUNCTION getHelloWorld()
RETURNS TABLE
AS
RETURN
  SELECT 'Hello' AS A, 'World' AS B;
GO



-- ���Դ洢����
CREATE PROCEDURE HelloWorld2
  @UserName VARCHAR(10),
  @OutVal   VARCHAR(10) OUTPUT,
  @InoutVal VARCHAR(20) OUTPUT
AS
BEGIN
  SET @OutVal = 'A';
  SET @InoutVal = @UserName + @InoutVal;
END;
go



-- ���Է��ؽ�����Ĵ洢����
CREATE PROCEDURE testProc
AS
BEGIN
  SELECT 'Hello 1' AS A, 'World 1' AS B UNION ALL
  SELECT 'Hello 2' AS A, 'World 2' AS B;
END
go

