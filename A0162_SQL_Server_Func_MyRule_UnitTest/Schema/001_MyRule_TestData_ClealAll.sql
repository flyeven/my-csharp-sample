-- ɾ�� ��ɫ-ģ�鹦�ܹ�ϵ����.
DELETE FROM mr_role_action 
WHERE
    role_id < 100
    OR action_id < 100
GO



-- ɾ�� ��ɫ-ģ���ϵ����.
DELETE FROM mr_role_module 
WHERE
    role_id < 100
    OR module_id < 100
GO



-- ɾ�� �û�-��ɫ��ϵ����.
DELETE FROM mr_user_role
WHERE
    user_id < 100
    OR role_id < 100
GO



-- ɾ�� ��ɫ����.
DELETE FROM mr_role WHERE role_id < 100
GO



-- ɾ�� �û�-ģ�鹦�ܹ�ϵ����.
DELETE FROM mr_user_action
WHERE
    user_id < 100
    OR action_id < 100
GO



-- ɾ�� �û�-ģ���ϵ����.
DELETE FROM mr_user_module
WHERE
    user_id < 100
    OR module_id < 100
GO



-- ɾ�� ģ�鹦������.
DELETE FROM mr_action WHERE action_id < 100
GO


-- ɾ�� ģ������.
DELETE FROM mr_module WHERE module_id < 100
GO



-- ɾ�� ����-�û���ϵ����.
DELETE FROM mr_dept_user 
WHERE 
    user_id < 100
GO


-- ɾ���û�����.
DELETE FROM mr_user WHERE user_id < 100
GO

-- ɾ����������.
DELETE FROM mr_dept WHERE dept_id < 100
GO
