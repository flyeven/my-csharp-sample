----------------------------------------
-----   ģ���������.               ----
----------------------------------------


SET IDENTITY_INSERT mr_module ON
GO


INSERT INTO mr_module (
    module_id,
    parent_id,
    module_name,
    status
)
SELECT  1,  NULL,   '���¹���',         1   UNION  ALL
SELECT  2,  1,      '������֯����',     1   UNION  ALL
SELECT  3,  1,      'Ȩ����֯����',     1   UNION  ALL
SELECT  4,  2,      '���Ź���',         1   UNION  ALL
SELECT  5,  2,      'ְλ����',         1   UNION  ALL
SELECT  6,  2,      '��Ա����',         1   UNION  ALL
SELECT  7,  3,      'Ȩ�޹���',         1   UNION  ALL
SELECT  8,  3,      'Ȩ�޹��ܹ���',     1   UNION  ALL
SELECT  9,  3,      '�ӿڽ�ɫ����',     1
GO


SET IDENTITY_INSERT mr_module OFF
GO


DBCC CHECKIDENT('mr_module', RESEED, 100)
GO



----------------------------------------
-----   ģ�鶯����������.           ----
----------------------------------------

SET IDENTITY_INSERT mr_action ON
GO


INSERT INTO mr_action (
    action_id,
    module_id,
    action_name,
    default_rule,
    status
)
SELECT  1,   4,  '��ѯ����', 1,  1   UNION ALL
SELECT  2,   4,  '��������', 0,  1   UNION ALL
SELECT  3,   4,  '�༭����', 0,  1   UNION ALL
SELECT  4,   4,  'ɾ������', 0,  1   UNION ALL
SELECT  5,   5,  '��ѯְλ', 1,  1   UNION ALL
SELECT  6,   5,  '����ְλ', 0,  1   UNION ALL
SELECT  7,   5,  '�༭ְλ', 0,  1   UNION ALL
SELECT  8,   5,  'ɾ��ְλ', 0,  1   UNION ALL
SELECT  9,   6,  '��ѯ��Ա', 1,  1   UNION ALL
SELECT  10,  6,  '������Ա', 0,  1   UNION ALL
SELECT  11,  6,  '�༭��Ա', 0,  1   UNION ALL
SELECT  12,  6,  'ɾ����Ա', 0,  1


SET IDENTITY_INSERT mr_action OFF
GO


DBCC CHECKIDENT('mr_action', RESEED, 100)
GO

