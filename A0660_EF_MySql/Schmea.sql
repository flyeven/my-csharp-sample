-- �������ݿ��ʱ��, ָ���ַ���.
CREATE DATABASE test_utf8
  DEFAULT CHARACTER SET utf8 
  COLLATE utf8_general_ci;



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

DELIMITER ;


call CreateReportData();




/* ���ڲ��� ���ô洢����  */


DELIMITER //
CREATE PROCEDURE HelloWorld2(
  IN vUserName VARCHAR(10),
  OUT vOutValue VARCHAR(10),
  INOUT vInOutValue VARCHAR(10))
BEGIN
  SELECT CONCAT('Hello ', vUserName);
  SET vOutValue = 'A';
  SET vInOutValue = 'B';
END//

DELIMITER ;




/* ���ڲ��� ���ú���  */

DELIMITER //
CREATE FUNCTION HelloWorldFunc()
RETURNS VARCHAR(20)
BEGIN
  RETURN 'Hello World!';
END;
//

DELIMITER ;








DELIMITER //

CREATE PROCEDURE testProc()
BEGIN
  SELECT 'Hello 1' AS A, 'World 1' AS B UNION ALL
  SELECT 'Hello 2' AS A, 'World 2' AS B;
END //

DELIMITER ;


-- ������ ����������, �޷��� ����Ӻ������롱�Ĵ����У� ѡ��洢�������� ֮��,  �� "��ȡ����Ϣ(G)" �İ�ť.
-- ��Ϊ���Ǹ�  ��ť�� ������  ����Ӻ������롱�Ĵ��� ֱ�ӹرա� ����޷���������.
-- ���ֻ���ֹ�����һ�� �հ׵ı�� �� ����Ӻ������롱�Ĵ����У� �����������ݵļ������棬 ѡ�� ��ʵ�塱�� Ȼ����ѡ�������.
CREATE TABLE TestProcResult (
	A	varchar(10),
	B	varchar(10),
	PRIMARY KEY (A,B)
);







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









-- ������������. ID ������.
CREATE TABLE test_main (
id      INT,
value   VARCHAR(10),
PRIMARY KEY(id) 
);


-- ���������ӱ�. 
CREATE TABLE test_sub (
id      INT,
main_id INT,
value   VARCHAR(10),
PRIMARY KEY(id) 
);


-- ���������ӱ� (��ǰ��� test_sub ƽ��). 
CREATE TABLE test_sub_s (
id      INT,
main_id INT,
value   VARCHAR(10),
PRIMARY KEY(id) 
);


-- ���������ӱ�  (�ñ���  �ӱ���ӱ� �� �� test_sub_s ����һ�� ). 
CREATE TABLE test_sub_of_sub (
id      INT,
sub_main_id INT,
value   VARCHAR(10),
PRIMARY KEY(id) 
);



-- ���������������.
INSERT INTO test_main(id, value) VALUES (1, 'ONE');
INSERT INTO test_main(id, value) VALUES (2, 'TWO');
INSERT INTO test_main(id, value) VALUES (3, 'THREE');
INSERT INTO test_main(id, value) VALUES (4, 'FOUR');


-- ��������ӱ�����.
INSERT INTO test_sub(id, main_id, value) VALUES (1, 1, 'ONEONE');
INSERT INTO test_sub(id, main_id, value) VALUES (2, 2, 'TWOTWO');




-- ��������ӱ�����.
INSERT INTO test_sub_s(id, main_id, value) VALUES (1, 1, 'һһ');
INSERT INTO test_sub_s(id, main_id, value) VALUES (2, 2, '����');
INSERT INTO test_sub_s(id, main_id, value) VALUES (3, 3, '����');

-- ��������ӱ�����.
INSERT INTO test_sub_of_sub(id, sub_main_id, value) VALUES (1, 1, 'ONEONEONE');
INSERT INTO test_sub_of_sub(id, sub_main_id, value) VALUES (2, 2, 'TWOTWOTWO');



-- ���Լ��
ALTER TABLE test_sub ADD CONSTRAINT fk_test_sub FOREIGN KEY (main_id) REFERENCES test_main(id);


ALTER TABLE test_sub_s ADD CONSTRAINT fk_test_sub_s FOREIGN KEY (main_id) REFERENCES test_main(id);


ALTER TABLE test_sub_of_sub ADD CONSTRAINT fk_test_sub_of_sub FOREIGN KEY (sub_main_id) REFERENCES test_sub_s(id);





----------
-- Many to Mang ��ϵ����.
----------


-- ѧ��.
CREATE TABLE test_student (
	student_code		INT 			NOT NULL ,
	student_name		VARCHAR(10) 	NOT NULL ,
	PRIMARY KEY(student_code) 
);

-- �γ�.
CREATE TABLE test_course (
	course_code		INT 			NOT NULL ,
	course_name		VARCHAR(10) 	NOT NULL ,
	PRIMARY KEY(course_code) 
);

-- �ɼ�.
CREATE TABLE test_score (
	student_code		INT 			NOT NULL ,
	course_code			INT 			NOT NULL ,
	score_value			INT				NOT NULL ,
	PRIMARY KEY(student_code, course_code) 
);


INSERT INTO test_student VALUES (1, '����');
INSERT INTO test_student VALUES (2, '����');
INSERT INTO test_student VALUES (3, '����');
INSERT INTO test_student VALUES (4, '����');



INSERT INTO test_course VALUES (1, '����');
INSERT INTO test_course VALUES (2, '��ѧ');
INSERT INTO test_course VALUES (3, 'Ӣ��');



INSERT INTO test_score VALUES (1, 1, 81);
INSERT INTO test_score VALUES (2, 1, 82);
INSERT INTO test_score VALUES (3, 1, 83);
INSERT INTO test_score VALUES (4, 1, 84);

INSERT INTO test_score VALUES (1, 2, 91);
INSERT INTO test_score VALUES (2, 2, 92);
INSERT INTO test_score VALUES (3, 2, 93);
INSERT INTO test_score VALUES (4, 2, 94);



-- ���Լ��
ALTER TABLE test_score ADD CONSTRAINT fk_test_score_student FOREIGN KEY (student_code) REFERENCES test_student(student_code);
ALTER TABLE test_score ADD CONSTRAINT fk_test_score_course FOREIGN KEY (course_code) REFERENCES test_course(course_code);



----------
--  AUTO_INCREMENT ����.
----------



-- �������Ա�. ID ������.  ���ݽ��� AUTO_INCREMENT ��ʽ����.
CREATE TABLE test_AUTO_INCREMENT_tab (
	id      INT  AUTO_INCREMENT,
	value   VARCHAR(10),
	PRIMARY KEY(id) 
);




