-- 创建测试主表. ID 是主键.
CREATE TABLE test_main (
id      INT,
value   VARCHAR(10),
PRIMARY KEY(id) 
);


-- 创建测试子表. 
CREATE TABLE test_sub (
id      INT,
main_id INT,
value   VARCHAR(10),
PRIMARY KEY(id) 
);


-- 插入测试主表数据.
INSERT INTO test_main(id, value) VALUES (1, 'ONE');
INSERT INTO test_main(id, value) VALUES (2, 'TWO');

-- 插入测试子表数据.
INSERT INTO test_sub(id, main_id, value) VALUES (1, 1, 'ONEONE');
INSERT INTO test_sub(id, main_id, value) VALUES (2, 2, 'TWOTWO');


-- 外键约束
ALTER TABLE test_sub ADD CONSTRAINT main_id_cons FOREIGN KEY (main_id) REFERENCES test_main;


----------
-- 并发的 流水号测试.
----------
CREATE TABLE test_sequence (
	table_name 			VARCHAR(32) 	NOT NULL ,
	sequence_number 	INT 			NOT NULL 
	PRIMARY KEY(table_name) 
);

INSERT INTO test_sequence VALUES ('test_main',  100);
INSERT INTO test_sequence VALUES ('test_sub',  100);




----------
-- Many to Mang 关系测试.
----------

-- 学生.
CREATE TABLE test_student (
	student_code		INT 			NOT NULL ,
	student_name		VARCHAR(10) 	NOT NULL ,
	PRIMARY KEY(student_code) 
);

-- 课程.
CREATE TABLE test_course (
	course_code		INT 			NOT NULL ,
	course_name		VARCHAR(10) 	NOT NULL ,
	PRIMARY KEY(course_code) 
);

-- 成绩.
CREATE TABLE test_score (
	student_code		INT 			NOT NULL ,
	course_code			INT 			NOT NULL ,
	score_value			INT				NOT NULL ,
	PRIMARY KEY(student_code, course_code) 
);


INSERT INTO test_student VALUES (1, '张三');
INSERT INTO test_student VALUES (2, '李四');
INSERT INTO test_student VALUES (3, '王五');
INSERT INTO test_student VALUES (4, '赵六');



INSERT INTO test_course VALUES (1, '语文');
INSERT INTO test_course VALUES (2, '数学');
INSERT INTO test_course VALUES (3, '英语');



INSERT INTO test_score VALUES (1, 1, 81);
INSERT INTO test_score VALUES (2, 1, 82);
INSERT INTO test_score VALUES (3, 1, 83);
INSERT INTO test_score VALUES (4, 1, 84);

INSERT INTO test_score VALUES (1, 2, 91);
INSERT INTO test_score VALUES (2, 2, 92);
INSERT INTO test_score VALUES (3, 2, 93);
INSERT INTO test_score VALUES (4, 2, 94);



-- 外键约束
ALTER TABLE test_score ADD CONSTRAINT fk_test_score_student FOREIGN KEY (student_code) REFERENCES test_student;
ALTER TABLE test_score ADD CONSTRAINT fk_test_score_course FOREIGN KEY (course_code) REFERENCES test_course;






----------
--  Identity 测试.
----------


-- 创建测试表. ID 是主键.  数据将由 Identity 方式自增.
CREATE TABLE test_Identity_tab (
	id      INT  identity(1, 1),
	value   VARCHAR(10),
	PRIMARY KEY(id) 
);






----------
--  存储过程 测试.
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

	-- 先插入主表数据.
	INSERT INTO test_main (id, value) VALUES (@main_id, @main_val);

	-- 后插入子表数据.
	INSERT INTO test_sub (id, main_id, value) VALUES (@sub_id, @main_id, @sub_val);

END;




CREATE PROCEDURE test_remove_main_sub (
	@main_id  	INT
) AS
BEGIN

	-- 先删除子表数据.
	DELETE 
		test_sub 
	WHERE
		main_id = @main_id;

	-- 后删除主表数据.
	DELETE 
		test_main
	WHERE
		id = @main_id;

END;





