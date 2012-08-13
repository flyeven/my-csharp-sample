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
	sequence_number 	INT 			NOT NULL 
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
ALTER TABLE test_score ADD CONSTRAINT fk_test_score_student FOREIGN KEY (student_code) REFERENCES test_student;
ALTER TABLE test_score ADD CONSTRAINT fk_test_score_course FOREIGN KEY (course_code) REFERENCES test_course;






----------
--  Identity ����.
----------


-- �������Ա�. ID ������.  ���ݽ��� Identity ��ʽ����.
CREATE TABLE test_Identity_tab (
	id      INT  identity(1, 1),
	value   VARCHAR(10),
	PRIMARY KEY(id) 
);






----------
--  �洢���� ����.
----------
CREATE PROCEDURE test_insert_main_sub (
	@main_val  	VARCHAR(10),
	@sub_val  	VARCHAR(10)
) AS
BEGIN

	DECLARE @main_id	INT,
			@sub_id		INT;

	SELECT 
		@main_id = sequence_number
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
		@sub_id = sequence_number
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
	INSERT INTO test_main (id, value) VALUES (@main_id, @main_val);

	-- ������ӱ�����.
	INSERT INTO test_sub (id, main_id, value) VALUES (@sub_id, @main_id, @sub_val);

END;




CREATE PROCEDURE test_remove_main_sub (
	@main_id  	INT
) AS
BEGIN

	-- ��ɾ���ӱ�����.
	DELETE 
		test_sub 
	WHERE
		main_id = @main_id;

	-- ��ɾ����������.
	DELETE 
		test_main
	WHERE
		id = @main_id;

END;





