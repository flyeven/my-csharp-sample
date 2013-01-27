CREATE TABLE SALE_REPORT (
      SALE_DATE  DATETIME NOT NULL ,
      SALE_ITEM  VARCHAR(2) NOT NULL ,
      SALE_MONEY DECIMAL(10,2) NOT NULL
);

ALTER TABLE sale_report
  ADD CONSTRAINT pk_sale_report PRIMARY KEY(sale_date, sale_item);
  
  
DELIMITER //
CREATE PROCEDURE CreateReportData()
BEGIN
  DECLARE  v_begin_day  DATE;
  DECLARE  v_end_day  DATE;

  SET v_begin_day = STR_TO_DATE('2009-01-01', '%Y-%m-%d');
  SET v_end_day = STR_TO_DATE('2010-01-01', '%Y-%m-%d');

  WHILE v_begin_day < v_end_day DO
    INSERT INTO SALE_REPORT VALUES
      (v_begin_day,  'A',
          Year(v_begin_day) );
    INSERT INTO SALE_REPORT VALUES
      (v_begin_day,  'B',
          Month(v_begin_day) );
    INSERT INTO SALE_REPORT VALUES
      (v_begin_day,  'C',
          DAY(v_begin_day) );
    SET v_begin_day = DATE_ADD(v_begin_day, INTERVAL 1 DAY);
  END WHILE;
END;
//


mysql> call CreateReportData() //




/* ���ڲ��� UTF-8 �Ľű�  */

-- �������ݿ��ʱ��, ָ���ַ���.
CREATE DATABASE test_utf8
  DEFAULT CHARACTER SET utf8 
  COLLATE utf8_general_ci;

/*
mysql> use test_utf8
Database changed
mysql> show variables like 'character%';
+--------------------------+----------------------------------------------------
-----+
| Variable_name            | Value
     |
+--------------------------+----------------------------------------------------
-----+
| character_set_client     | latin1
     |
| character_set_connection | latin1
     |
| character_set_database   | utf8
     |
| character_set_filesystem | binary
     |
| character_set_results    | latin1
     |
| character_set_server     | latin1
     |
| character_set_system     | utf8
     |
| character_sets_dir       | C:\Program Files\MySQL\MySQL Server 5.0\share\chars
ets\ |
+--------------------------+----------------------------------------------------
-----+
8 rows in set (0.00 sec)
*/


-- �������ʱ��, ָ���ַ���.
CREATE  TABLE  test_tab (
    id   	INT  AUTO_INCREMENT,
    value1  varchar(20),
	value2  nvarchar(20),
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*  
  ���� UTF8 ��ʱ�� C# �������ַ����У�Ҫ����  charset=utf8   
���磺
Server=192.168.56.101;Database=test_utf8;Uid=test_user;Pwd=testpassword; charset=utf8


ע��
dos�²�֧��UTF8����ʾ.

*/



