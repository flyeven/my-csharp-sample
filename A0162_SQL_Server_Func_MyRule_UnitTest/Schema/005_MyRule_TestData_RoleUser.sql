----------------------------------------
-----   ��ɫ��������.               ----
----------------------------------------

SET IDENTITY_INSERT mr_role ON
GO


INSERT INTO mr_role (
    role_id,
    role_name,
    status
)
SELECT  1,  'ȫ��Ȩ��', 1      UNION
SELECT  2,  'ֻ��Ȩ��', 1      UNION
SELECT  3,  '��дȨ��', 1      


SET IDENTITY_INSERT mr_role OFF
GO


DBCC CHECKIDENT('mr_role', RESEED, 100)
GO




----------------------------------------
-----   �û�-��ɫ��ϵ ��������.      ----
----------------------------------------

INSERT INTO mr_user_role (
    user_id,
    role_id
)
SELECT  5,  1   UNION ALL       -- �ţ� : ȫ��Ȩ��
SELECT  6,  2   UNION ALL       -- ��� : ֻ��Ȩ��
SELECT  7,  3                   -- ���� : ��дȨ��
GO



