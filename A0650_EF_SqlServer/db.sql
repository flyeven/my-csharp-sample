-- �����ǰ���ݿ���,�Ѿ������б� test_sub_of_sub, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_sub_of_sub')  
  DROP TABLE test_sub_of_sub
GO

-- �����ǰ���ݿ���,�Ѿ������б� test_sub_s, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_sub_s')  
  DROP TABLE test_sub_s
GO

-- �����ǰ���ݿ���,�Ѿ������б� test_sub, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_sub')  
  DROP TABLE test_sub
GO

-- �����ǰ���ݿ���,�Ѿ������б� test_main, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_main')  
  DROP TABLE test_main
GO



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
GO


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
GO


-- ���Լ��
ALTER TABLE test_sub ADD CONSTRAINT fk_test_sub FOREIGN KEY (main_id) REFERENCES test_main;
GO

ALTER TABLE test_sub_s ADD CONSTRAINT fk_test_sub_s FOREIGN KEY (main_id) REFERENCES test_main;
GO

ALTER TABLE test_sub_of_sub ADD CONSTRAINT fk_test_sub_of_sub FOREIGN KEY (sub_main_id) REFERENCES test_sub_s;
GO






----------
-- ������ ��ˮ�Ų���.
----------

-- �����ǰ���ݿ���,�Ѿ������б� test_sequence, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_sequence')  
  DROP TABLE test_sequence
GO


CREATE TABLE test_sequence (
	table_name 			VARCHAR(32) 	NOT NULL ,
	sequence_number 	INT 			NOT NULL 
	PRIMARY KEY(table_name) 
);
GO

INSERT INTO test_sequence VALUES ('test_main',  100);
INSERT INTO test_sequence VALUES ('test_sub',  100);
GO



----------
-- Many to Mang ��ϵ����.
----------

-- �����ǰ���ݿ���,�Ѿ������б� test_score, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_score')  
  DROP TABLE test_score
GO

-- �����ǰ���ݿ���,�Ѿ������б� test_course, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_course')  
  DROP TABLE test_course
GO


-- �����ǰ���ݿ���,�Ѿ������б� test_student, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.tables WHERE name = 'test_student')  
  DROP TABLE test_student
GO



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
GO

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
GO


-- ���Լ��
ALTER TABLE test_score ADD CONSTRAINT fk_test_score_student FOREIGN KEY (student_code) REFERENCES test_student;
ALTER TABLE test_score ADD CONSTRAINT fk_test_score_course FOREIGN KEY (course_code) REFERENCES test_course;
GO





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





----------
--  �洢���� ����.
----------
-- �����ǰ���ݿ���,�Ѿ������д洢���� test_insert_main_sub, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.procedures WHERE name = 'test_insert_main_sub')  
  DROP PROCEDURE test_insert_main_sub
GO

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
GO


-- �����ǰ���ݿ���,�Ѿ������д洢���� test_remove_main_sub, ��ô��ɾ����.
IF EXISTS ( SELECT 1 FROM sys.procedures WHERE name = 'test_remove_main_sub')  
  DROP PROCEDURE test_remove_main_sub
GO

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
GO




