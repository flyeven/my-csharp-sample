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


-- ���������������.
INSERT INTO test_main(id, value) VALUES (1, 'ONE');
INSERT INTO test_main(id, value) VALUES (2, 'TWO');

-- ��������ӱ�����.
INSERT INTO test_sub(id, main_id, value) VALUES (1, 1, 'ONEONE');
INSERT INTO test_sub(id, main_id, value) VALUES (2, 2, 'TWOTWO');


-- ���Լ��
ALTER TABLE test_sub ADD CONSTRAINT main_id_cons FOREIGN KEY (main_id) REFERENCES test_main;



----------
-- ������ ��ˮ�Ų���.
----------
CREATE TABLE test_sequence (
	table_name 			VARCHAR(32) 	NOT NULL ,
	sequence_number 	INT 			NOT NULL ,
	PRIMARY KEY(table_name) 
);

INSERT INTO test_sequence VALUES ('test_main',  100);
INSERT INTO test_sequence VALUES ('test_sub',  100);








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
ALTER TABLE test_score 
	ADD CONSTRAINT fk_test_score_student 
		FOREIGN KEY (student_code) 
			REFERENCES test_student;

ALTER TABLE test_score ADD CONSTRAINT fk_test_score_course FOREIGN KEY (course_code) REFERENCES test_course;








----------
--  SEQUENCE ����.
----------

CREATE SEQUENCE SEQ_TEST_EF
	INCREMENT BY 1    -- ÿ�ε���1
	START WITH 1       -- ��1��ʼ
	NOMAXVALUE      -- û�����ֵ
	MINVALUE 1       -- ��Сֵ=1
	NOCYCLE      -- ��ѭ��
;


-- �������Ա�. ID ������.  ���ݽ��� ������ �����к��л�ȡ.
CREATE TABLE test_seq_tab (
	id      INT,
	value   VARCHAR(10),
	PRIMARY KEY(id) 
);


-- ������.
CREATE OR REPLACE TRIGGER "T_SEQ_TEST_EF" BEFORE INSERT
ON test_seq_tab FOR EACH ROW
BEGIN
	SELECT SEQ_TEST_EF.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/






----------
--  �洢���� ����.
----------

CREATE OR REPLACE PROCEDURE "TEST_INSERT_MAIN_SUB" (
	p_main_val  	test_main.value%TYPE,
	p_sub_val  		test_sub.value%TYPE
) AS
	v_main_id	test_main.id%TYPE;
	v_sub_id	test_sub.id%TYPE;
BEGIN

	SELECT 
		sequence_number  INTO  v_main_id
	FROM 
		test_sequence
	WHERE
		table_name = 'test_main';

	UPDATE 
		test_sequence
	SET
		sequence_number = sequence_number + 1
	WHERE
		table_name = 'test_main';
		
		
	SELECT 
		sequence_number  INTO  v_sub_id
	FROM 
		test_sequence
	WHERE
		table_name = 'test_sub';
	
	UPDATE 
		test_sequence
	SET
		sequence_number = sequence_number + 1
	WHERE
		table_name = 'test_sub';

	-- �Ȳ�����������.
	INSERT INTO test_main (id, value) VALUES ( v_main_id, p_main_val);

	-- ������ӱ�����.
	INSERT INTO test_sub (id, main_id, value) VALUES ( v_sub_id, v_main_id, p_sub_val);

END;
/


CREATE OR REPLACE PROCEDURE "TEST_REMOVE_MAIN_SUB" (
	p_main_id  	test_main.id%TYPE
) AS
BEGIN

	-- ��ɾ���ӱ�����.
	DELETE 
		test_sub 
	WHERE
		main_id = p_main_id;

	-- ��ɾ����������.
	DELETE 
		test_main
	WHERE
		id = p_main_id;

END;
/





----------
--  �ֶ�ִ�� SQL ���Ĳ���.
--  ���������Ϊ�� ��֤  ���ֶ�ִ�� SQL ��䡱  �����ϵĿ����ԡ�
----------


-- ����� ������ģ�� sql ��䷵�ؽ����  �ṹ�� 
-- ������һ�� �տǣ� ����Ҫ����κ����ݵġ�
CREATE TABLE QUERY_RESULT_MAIN_AND_SUB (
	id				INT,
	main_value		VARCHAR(10),
	sub_value		VARCHAR(10),
	PRIMARY KEY(id) 
);


-- ������ ׼���� Entity Framework �У� ִ�е� SQL ���.
-- ��Ҫע�⣬ ÿһ�У� ��Ҫ�� ������Ǹ� �տǵı�� �ֶ���һ��.
select
  s.id		as id,
  m.value 	as main_value, 
  s.value 	as sub_value
from
  test_main  m
    join test_sub  s
      on (m.id = s.main_id)


