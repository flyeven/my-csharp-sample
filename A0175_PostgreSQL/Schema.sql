-- ����
CREATE TABLE sale_report (
     sale_date  DATE NOT NULL ,
     sale_item  VARCHAR(2) NOT NULL ,
     sale_money DECIMAL(10,2) NOT NULL,
     PRIMARY KEY(sale_date, sale_item)
);


-- ��������

CREATE OR REPLACE FUNCTION InitQueryTestData() RETURNS void AS
$$
DECLARE
  v_begin_day  DATE;
  v_end_day  DATE;
BEGIN
  v_begin_day := '2009-01-01';
  v_end_day := '2013-01-01';

  WHILE v_begin_day < v_end_day LOOP
    INSERT INTO SALE_REPORT VALUES(v_begin_day,  'A',  EXTRACT(year FROM v_begin_day) );
    INSERT INTO SALE_REPORT VALUES(v_begin_day,  'B',  EXTRACT(month FROM v_begin_day) );
    INSERT INTO SALE_REPORT VALUES(v_begin_day,  'C',  EXTRACT(day FROM  v_begin_day) );
    v_begin_day := v_begin_day + 1;
  END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT InitQueryTestData();



-- ���Ժ���
CREATE OR REPLACE FUNCTION HelloWorld() RETURNS varchar AS
$$
BEGIN
  RETURN 'Hello World!';
END;
$$
LANGUAGE plpgsql;


-- ���� IN/OUT ����.
CREATE OR REPLACE FUNCTION HelloWorld2 (
  IN vUserName VARCHAR,
  OUT vOutValue VARCHAR
) AS
$$
BEGIN
  vOutValue := 'A' || vUserName;
END;
$$
LANGUAGE plpgsql;





-- ���Է��ؽ�����ĺ���
CREATE OR REPLACE FUNCTION TestReturnList() RETURNS setof sale_report AS $$
  SELECT * FROM sale_report LIMIT 10;
$$ 
LANGUAGE SQL;



----- ���������� -----
-- ��� C# �ͻ��ˣ� �� PostgreSQL �������� ����ͬһ̨�����������¡�
-- ���� Connection  Open ��ʱ�� �ᷢ���쳣��

/**********

1����Ҫ�޸� �������µ�  pg_hba.conf   �ļ�

��
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5

���棬 ׷��һ��
host    all             all             192.168.56.0/24         md5

ע��192.168.56.0 ������Σ� ��Ҫ�������������д��  
���Ի����£� PostgreSQL ���ݿ�������� ip ��ַ�� 192.168.56.101 �� ��˾���д 192.168.56.0 �������



2���鿴 postgresql.conf �ļ���
�����  
listen_addresses = 

�����  listen_addresses = '*'	�� ��ôû�����⡣
�����  listen_addresses = 'localhost'  �� ��ô��Ҫ�޸�Ϊ listen_addresses = '*'

**********/