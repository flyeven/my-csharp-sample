SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MyRule_UserOwnRole')
  DROP FUNCTION MyRule_UserOwnRole
GO



-- =============================================
-- Author:		Edward.Wang
-- Description:	��ȡ ָ�� �û�ӵ�е� "��ɫ" �б�.
-- =============================================
CREATE FUNCTION MyRule_UserOwnRole
(
    @userID     int
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        role_id,
        role_name,
        status
    FROM
        mr_role
    WHERE
        EXISTS(
            SELECT 1
            FROM
                mr_user_role
            WHERE
                mr_user_role.role_id = mr_role.role_id
                AND mr_user_role.user_id = @userID
        )
)
GO







IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MyRule_RoleAccessAbleModule')
  DROP FUNCTION MyRule_RoleAccessAbleModule
GO



-- =============================================
-- Author:		Edward.Wang
-- Description:	��ȡ ָ�� ��ɫ�� "�ɷ���ģ��" �б�.
--              �ɷ���ģ����� ��ɫֱ�ӿɷ���ģ�� �� ��ɫֱ�ӿɷ���ģ�������ģ��.
-- =============================================
CREATE FUNCTION MyRule_RoleAccessAbleModule
(
    @roleID     int
)
RETURNS TABLE
AS
RETURN
(
    WITH StepCTE
    AS
    (
        SELECT
            module_id,
            parent_id,
            module_name,
            status
        FROM
            mr_module
        WHERE
            EXISTS (
                SELECT 1
                FROM mr_role_module
                WHERE
                    mr_module.module_id = mr_role_module.module_id
                    AND mr_role_module.role_id = @roleID
            )
        UNION ALL
        SELECT
            T.module_id,
            T.parent_id,
            T.module_name,
            T.status
        FROM
            mr_module T INNER JOIN StepCTE CTE
            ON T.parent_id = CTE.module_id
     )
     SELECT
        module_id,
        parent_id,
        module_name,
        status
     FROM
        StepCTE
)
GO


---------------------------------------------------------------
-- SELECT * FROM MyRule_RoleAccessAbleModule(1);
-- SELECT * FROM MyRule_RoleAccessAbleModule(2);
---------------------------------------------------------------






IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MyRule_RoleAccessAbleAction')
  DROP FUNCTION MyRule_RoleAccessAbleAction
GO




-- =============================================
-- Author:		Edward.Wang
-- Description:	��ȡ ָ����ɫ ��ָ��ģ�� �� "�ɷ��ʶ���" �б�.
--              �ɷ��ʶ��������� ��ǰģ��� Ĭ�Ͽ��ö��� �� ��Խ�ɫ��Ȩ�˵Ķ���.
-- =============================================
CREATE FUNCTION MyRule_RoleAccessAbleAction
(
    @roleID     int,
    @moduleID   int
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        action_id,
        module_id,
        action_name,
        default_rule,
        status
    FROM
        mr_action
    WHERE
        module_id = @moduleID
        AND (             
            -- ����Ϊ ģ���Ĭ�Ͽ��ö���.
            default_rule = 1                
            -- ֱ����Խ�ɫ��Ȩ��
            OR EXISTS (
                SELECT 1
                FROM
                    mr_role_action
                WHERE
                    mr_role_action.role_id = @roleID
                    AND mr_role_action.action_id = mr_action.action_id
            )
        )
        AND  -- ��ɫ�� ģ���Ȩ��.
            EXISTS (
                SELECT 1
                FROM
                    MyRule_RoleAccessAbleModule(@roleID) AS RAAM
                WHERE
                    RAAM.module_id = mr_action.module_id
            )
)
GO



---------------------------------------------------------------
-- SELECT * FROM MyRule_RoleAccessAbleAction(1, 4);
-- SELECT * FROM MyRule_RoleAccessAbleAction(2, 4);
---------------------------------------------------------------



