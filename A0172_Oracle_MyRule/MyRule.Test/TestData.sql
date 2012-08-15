

-- ��������.
INSERT INTO mr_dept_type (
	dept_type,	dept_type_desc,	status
) VALUES (
	'NORMAL',	'ʵ�岿������',	1
);


-- ����.
INSERT INTO mr_dept (
	dept_code,	dept_type,	parent_code,
	dept_name,	status
)
SELECT  'OS_000',  'NORMAL',	NULL,   	'�ܹ�˾',       1	FROM dual       UNION ALL
SELECT  'OS_010',  'NORMAL',	'OS_000',	'����',       1	FROM dual       UNION ALL
SELECT  'OS_020',  'NORMAL',	'OS_000',	'���²�',       1	FROM dual       UNION ALL
SELECT  'OS_030',  'NORMAL',	'OS_000',	'����������',   1	FROM dual       UNION ALL
SELECT  'OS_040',  'NORMAL',	'OS_000',	'ϵͳ���в�',   1	FROM dual       UNION ALL
SELECT  'OS_050',  'NORMAL',	'OS_000',	'�г���',       1	FROM dual       UNION ALL
SELECT  'OS_031',  'NORMAL',	'OS_030',	'Ӳ����',       1	FROM dual       UNION ALL
SELECT  'OS_032',  'NORMAL',	'OS_030',	'�����',       1	FROM dual       UNION ALL
SELECT  'OS_033',  'NORMAL',	'OS_030',	'������',       1	FROM dual;


-- �û�.
INSERT INTO mr_user (
	user_code,	user_name,	status
)
SELECT  'H00I001',  '����',     1   FROM dual  UNION ALL
SELECT  'H00I002',  '����',     1   FROM dual  UNION ALL
SELECT  'H00I003',  '����',     1   FROM dual  UNION ALL
SELECT  'H00I004',  '����',     1   FROM dual  UNION ALL
SELECT  'H00I005',  '�ţ�',     1   FROM dual  UNION ALL
SELECT  'H00I006',  '���',     1   FROM dual  UNION ALL
SELECT  'H00I007',  '����',     1   FROM dual  UNION ALL
SELECT  'H00I008',  '�ԣ�',     1   FROM dual;


-- ���� - �û���ϵ.
INSERT INTO mr_dept_user (
    dept_code,	user_code
)
SELECT  'OS_000',   'H00I001'  FROM dual  UNION ALL
SELECT  'OS_010',   'H00I002'  FROM dual  UNION ALL
SELECT  'OS_020',   'H00I003'  FROM dual  UNION ALL
SELECT  'OS_030',   'H00I004'  FROM dual  UNION ALL
SELECT  'OS_040',   'H00I005'  FROM dual  UNION ALL
SELECT  'OS_050',   'H00I006'  FROM dual  UNION ALL
SELECT  'OS_031',   'H00I007'  FROM dual  UNION ALL
SELECT  'OS_032',   'H00I008'  FROM dual;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


-- ����ģ��

INSERT INTO mr_module (
	module_code,	parent_code,	module_name,	status
)
SELECT  'M01',  NULL,   	'���¹���',         1   FROM dual	UNION  ALL
SELECT  'M02',  'M01',      '������֯����',     1   FROM dual	UNION  ALL
SELECT  'M03',  'M01',      'Ȩ����֯����',     1   FROM dual	UNION  ALL
SELECT  'M04',  'M02',      '���Ź���',         1   FROM dual	UNION  ALL
SELECT  'M05',  'M02',      'ְλ����',         1   FROM dual	UNION  ALL
SELECT  'M06',  'M02',      '��Ա����',         1   FROM dual	UNION  ALL
SELECT  'M07',  'M03',      'Ȩ�޹���',         1   FROM dual	UNION  ALL
SELECT  'M08',  'M03',      'Ȩ�޹��ܹ���',     1   FROM dual	UNION  ALL
SELECT  'M09',  'M03',      '�ӿڽ�ɫ����',     1   FROM dual;


-- ����
INSERT INTO mr_action (
	action_code,	module_code,	action_name,
	default_rule,	status
)
SELECT  'A001',   'M04',  '��ѯ����', 1,  1  FROM dual	 UNION ALL
SELECT  'A002',   'M04',  '��������', 0,  1  FROM dual	 UNION ALL
SELECT  'A003',   'M04',  '�༭����', 0,  1  FROM dual	 UNION ALL
SELECT  'A004',   'M04',  'ɾ������', 0,  1  FROM dual	 UNION ALL
SELECT  'A005',   'M05',  '��ѯְλ', 1,  1  FROM dual	 UNION ALL
SELECT  'A006',   'M05',  '����ְλ', 0,  1  FROM dual	 UNION ALL
SELECT  'A007',   'M05',  '�༭ְλ', 0,  1  FROM dual	 UNION ALL
SELECT  'A008',   'M05',  'ɾ��ְλ', 0,  1  FROM dual	 UNION ALL
SELECT  'A009',   'M06',  '��ѯ��Ա', 1,  1  FROM dual	 UNION ALL
SELECT  'A010',   'M06',  '������Ա', 0,  1  FROM dual	 UNION ALL
SELECT  'A011',   'M06',  '�༭��Ա', 0,  1  FROM dual	 UNION ALL
SELECT  'A012',   'M06',  'ɾ����Ա', 0,  1  FROM dual;







----------------------------------------
-----   �û�-ģ���ϵ ��������.      ----
----------------------------------------



INSERT INTO mr_user_module (
    user_code,
    module_code
)
SELECT  'H00I001',  'M01'	FROM dual   UNION ALL       -- ���� : ���¹���������֯+Ȩ�޹��� ȫ������
SELECT  'H00I002',  'M02'	FROM dual   UNION ALL       -- ���� : ������֯����(����+ְλ+��Ա) ȫ������
SELECT  'H00I003',  'M04'	FROM dual   UNION ALL       -- ���� : ���Ź���
SELECT  'H00I004',  'M07'	FROM dual                   -- ���� : Ȩ�޹���
;




----------------------------------------
-----   �û�-ģ�鶯����ϵ ��������.  ----
----------------------------------------

INSERT INTO mr_user_action (
    user_code,
    action_code
)
SELECT  'H00I001',  'A002'	FROM  dual   UNION ALL       -- ���� �������༭��ɾ�� ����
SELECT  'H00I001',  'A003'	FROM  dual   UNION ALL
SELECT  'H00I001',  'A004'	FROM  dual   UNION ALL
SELECT  'H00I002',  'A003'	FROM  dual   UNION ALL       -- ���� �༭��ɾ�� ����
SELECT  'H00I002',  'A004'	FROM  dual   UNION ALL
SELECT  'H00I003',  'A003'	FROM  dual                   -- ���� �༭ ����
;








----------------------------------------
-----   ��ɫ��������.               ----
----------------------------------------

INSERT INTO mr_role (
    role_code,
    role_name,
    status
)
SELECT  'R01',  'ȫ��Ȩ��', 1  FROM dual    UNION
SELECT  'R02',  'ֻ��Ȩ��', 1  FROM dual    UNION
SELECT  'R03',  '��дȨ��', 1  FROM dual;




----------------------------------------
-----   �û�-��ɫ��ϵ ��������.      ----
----------------------------------------

INSERT INTO mr_user_role (
    user_code,
    role_code
)
SELECT  'H00I005',  'R01'	FROM dual   UNION ALL       -- �ţ� : ȫ��Ȩ��
SELECT  'H00I006',  'R02'	FROM dual   UNION ALL       -- ��� : ֻ��Ȩ��
SELECT  'H00I007',  'R03'	FROM dual                   -- ���� : ��дȨ��
;






----------------------------------------
-----   ��ɫ-ģ���ϵ ��������.     ----
----------------------------------------
INSERT INTO mr_role_module (
    role_code,    module_code 
)
SELECT  'R01',  'M01'	FROM dual   UNION  ALL
SELECT  'R02',  'M02'	FROM dual   UNION  ALL
SELECT  'R03',  'M04'	FROM dual;





----------------------------------------
-----   ��ɫ-ģ�鶯����ϵ ��������.  ----
----------------------------------------
INSERT INTO mr_role_action (
    role_code,    action_code
)
SELECT  'R01',  'A001'  FROM  dual   UNION  ALL
SELECT  'R01',  'A002'  FROM  dual   UNION  ALL
SELECT  'R01',  'A003'  FROM  dual   UNION  ALL
SELECT  'R01',  'A004'  FROM  dual   UNION  ALL
SELECT  'R01',  'A005'  FROM  dual   UNION  ALL
SELECT  'R01',  'A006'  FROM  dual   UNION  ALL
SELECT  'R01',  'A007'  FROM  dual   UNION  ALL
SELECT  'R01',  'A008'  FROM  dual   UNION  ALL
SELECT  'R01',  'A009'  FROM  dual   UNION  ALL
SELECT  'R01',  'A010'  FROM  dual  UNION  ALL
SELECT  'R01',  'A011'  FROM  dual  UNION  ALL
SELECT  'R01',  'A012'  FROM  dual  UNION  ALL
SELECT  'R02',  'A001'  FROM  dual   UNION  ALL
SELECT  'R02',  'A005'  FROM  dual   UNION  ALL
SELECT  'R02',  'A009'  FROM  dual   UNION  ALL
SELECT  'R03',  'A001'  FROM  dual   UNION  ALL
SELECT  'R03',  'A003'  FROM  dual   UNION  ALL
SELECT  'R03',  'A005'  FROM  dual   UNION  ALL
SELECT  'R03',  'A007'  FROM  dual   UNION  ALL
SELECT  'R03',  'A009'  FROM  dual   UNION  ALL
SELECT  'R03',  'A011'  FROM  dual;




