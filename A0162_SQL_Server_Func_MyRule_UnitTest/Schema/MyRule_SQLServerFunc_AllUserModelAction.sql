SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MyRule_AllUserAccessAbleModule')
  DROP FUNCTION MyRule_AllUserAccessAbleModule
GO



-- =============================================
-- Author:		Edward.Wang
-- Description:	��ȡ ָ�� �û��� ȫ���� "�ɷ���ģ��" �б�.
--              �ɷ���ģ����� �û�ֱ�ӿɷ���ģ�� �� �û�ֱ�ӿɷ���ģ�������ģ��.
--              �Լ� �û��Ľ�ɫ ֱ�ӿɷ���ģ�� �� �û��Ľ�ɫֱ�ӿɷ���ģ�������ģ��.
-- =============================================
CREATE FUNCTION MyRule_AllUserAccessAbleModule
(
    @userID     int
)
RETURNS TABLE
AS
RETURN
(
    -- �û�ֱ�ӿɷ���ģ��
    SELECT
        module_id,
        parent_id,
        module_name,
        status
    FROM
        MyRule_UserAccessAbleModule(@userID)
    UNION ALL   -- ����ʹ�� UNION ALL�� ���ϲ��� �ظ�������
    -- �û��Ľ�ɫ�ɷ���ģ��
    SELECT
        RAAM.module_id,
        RAAM.parent_id,
        RAAM.module_name,
        RAAM.status
    FROM
        MyRule_UserOwnRole(@userID) AS UOR
        CROSS APPLY
        MyRule_RoleAccessAbleModule( UOR.role_id )  AS  RAAM
)
GO











IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MyRule_AllUserAccessAbleAction')
  DROP FUNCTION MyRule_AllUserAccessAbleAction
GO




-- =============================================
-- Author:		Edward.Wang
-- Description:	��ȡ ָ���û� ��ָ��ģ�� ȫ���� "�ɷ��ʶ���" �б�.
--              �ɷ��ʶ��������� ��ǰģ��� Ĭ�Ͽ��ö��� �� ����û���Ȩ�˵Ķ���.
--              �Լ���� �û��Ľ�ɫ��Ȩ�˵Ķ���.
-- =============================================
CREATE FUNCTION MyRule_AllUserAccessAbleAction
(
    @userID     int,
    @moduleID   int
)
RETURNS TABLE
AS
RETURN
(
    -- �û�ֱ�ӿɷ���ģ�鶯��.
    SELECT
        action_id,
        module_id,
        action_name,
        default_rule,
        status
    FROM
        MyRule_UserAccessAbleAction(@userID, @moduleID)
    UNION ALL   -- ����ʹ�� UNION ALL�� ���ϲ��� �ظ�������
    SELECT
        RAAA.action_id,
        RAAA.module_id,
        RAAA.action_name,
        RAAA.default_rule,
        RAAA.status
    FROM
        MyRule_UserOwnRole(@userID) AS UOR
        CROSS APPLY
        MyRule_RoleAccessAbleAction( UOR.role_id, @moduleID )  AS  RAAA
)
GO

