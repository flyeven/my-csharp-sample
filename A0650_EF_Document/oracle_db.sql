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



COMMENT ON TABLE "TEST_MAIN" IS '��������'
/
COMMENT ON TABLE "TEST_SUB" IS '�����ӱ�'
/


COMMENT ON COLUMN "TEST_MAIN"."ID" IS '����������'
/
COMMENT ON COLUMN "TEST_MAIN"."VALUE" IS '����������ֵ'
/


COMMENT ON COLUMN "TEST_SUB"."ID" IS '�����ӱ���'
/
COMMENT ON COLUMN "TEST_SUB"."MAIN_ID" IS '����������'
/
COMMENT ON COLUMN "TEST_SUB"."VALUE" IS '�����ӱ���ֵ'
/

