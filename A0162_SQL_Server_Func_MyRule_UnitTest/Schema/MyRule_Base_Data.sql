
TRUNCATE TABLE mr_permission;
GO


INSERT INTO mr_permission (
    permission_id,
    permission_name,
    permission_desc
) 
SELECT 1,   'DEFAULT',  'Ĭ�ϵ�Ȩ��[��������ø��ӵ�Ȩ�޹�����ôֻ��Ҫ��һ���Ϳ�����]' UNION ALL
SELECT 2,   'SELECT',   '������Ȩ��'    UNION  ALL
SELECT 4,   'INSERT',   '������Ȩ��'    UNION  ALL
SELECT 8,   'UPDATE',   '���µ�Ȩ��'    UNION  ALL
SELECT 16,  'DELETE',   'ɾ����Ȩ��'
GO
