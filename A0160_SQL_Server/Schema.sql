-- 建表
CREATE TABLE sale_report (
     sale_date  DATETIME NOT NULL ,
     sale_item  VARCHAR(2) NOT NULL ,
     sale_money DECIMAL(10,2) NOT NULL,
     PRIMARY KEY(sale_date, sale_item)
)
go



-- 测试数据
DECLARE
  @v_begin_day DATETIME, @v_end_day DATETIME;
BEGIN
  SET @v_begin_day = '2009-01-01';
  SET @v_end_day = '2010-01-01';

  WHILE @v_begin_day < @v_end_day
  BEGIN
    INSERT INTO SALE_REPORT VALUES(@v_begin_day,  'A',   YEAR(@v_begin_day) )

     INSERT INTO SALE_REPORT VALUES(@v_begin_day,  'B',   MONTH(@v_begin_day) )

     INSERT INTO SALE_REPORT VALUES(@v_begin_day,  'C',   DAY(@v_begin_day) )

     SET @v_begin_day = @v_begin_day + 1;
   END;
END;
go



-- 测试函数
CREATE FUNCTION HelloWorldFunc()
RETURNS VARCHAR(20)
AS
BEGIN
  RETURN 'Hello World!';
END
go


-- 测试返回结果集函数
CREATE FUNCTION getHelloWorld()
RETURNS TABLE
AS
RETURN
  SELECT 'Hello' AS A, 'World' AS B;
GO



-- 测试存储过程
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
