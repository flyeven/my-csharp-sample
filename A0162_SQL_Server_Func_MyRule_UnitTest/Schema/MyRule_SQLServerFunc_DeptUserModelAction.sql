SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MyRule_UserAccessAbleDept')
  DROP FUNCTION MyRule_UserAccessAbleDept
GO



-- =============================================
-- Author:		Edward.Wang
-- Description:	��ȡ ָ�� �û��� "�ɷ��ʲ���" �б�.
--              �ɷ��ʲ��Ű��� �û���ǰ���� �� �û���ǰ���ŵ���������.
-- =============================================
CREATE FUNCTION MyRule_UserAccessAbleDept
(
    @userID     int,
    @deptType   varchar(10)
)
RETURNS TABLE
AS
RETURN
(
    WITH StepCTE
    AS
    (
        SELECT
            mr_dept.dept_id,
            parent_id,
            dept_name,
            dept_type,
            status,
            mr_dept_user.permission_data           
        FROM
            mr_dept
              JOIN  mr_dept_user
                ON (mr_dept.dept_id = mr_dept_user.dept_id)
        WHERE
            mr_dept_user.user_id = @userID
            AND mr_dept.dept_type = @deptType
        UNION ALL
        SELECT
            T.dept_id,
            T.parent_id,
            T.dept_name,
            T.dept_type,
            T.status,
            CTE.permission_data 
        FROM
            mr_dept T INNER JOIN StepCTE CTE
            ON T.parent_id = CTE.dept_id
     )
     SELECT
        dept_id,
        parent_id,
        dept_name,
        dept_type
        status,
        permission_data
     FROM
        StepCTE
)
GO



---------------------------------------------------------------
-- SELECT * FROM MyRule_UserAccessAbleDept(1);
-- SELECT * FROM MyRule_UserAccessAbleDept(2);
---------------------------------------------------------------




IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MyRule_UserAccessAbleModel')
  DROP FUNCTION MyRule_UserAccessAbleModel
GO



-- =============================================
-- Author:		Edward.Wang
-- Description:	��ȡ ָ�� �û��� "�ɷ���ģ��" �б�.
--              �ɷ���ģ����� �û�ֱ�ӿɷ���ģ�� �� �û�ֱ�ӿɷ���ģ�������ģ��.
-- =============================================
CREATE FUNCTION MyRule_UserAccessAbleModel
(
    @userID     int
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
                FROM mr_user_module
                WHERE
                    mr_module.module_id = mr_user_module.module_id
                    AND mr_user_module.user_id = @userID
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
-- SELECT * FROM MyRule_UserAccessAbleModel(1);
-- SELECT * FROM MyRule_UserAccessAbleModel(2);
---------------------------------------------------------------





IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MyRule_UserAccessAbleAction')
  DROP FUNCTION MyRule_UserAccessAbleAction
GO




-- =============================================
-- Author:		Edward.Wang
-- Description:	��ȡ ָ���û� ��ָ��ģ�� �� "�ɷ��ʶ���" �б�.
--              �ɷ��ʶ��������� ��ǰģ��� Ĭ�Ͽ��ö��� �� ����û���Ȩ�˵Ķ���.
-- =============================================
CREATE FUNCTION MyRule_UserAccessAbleAction
(
    @userID     int,
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
            -- ֱ������û���Ȩ�˵Ķ���.
            OR             
            EXISTS (
                SELECT 1
                FROM
                    mr_user_action
                WHERE
                    mr_user_action.user_id = @userID
                    AND mr_user_action.action_id = mr_action.action_id
            )
        )
        AND -- �û��� ģ���Ȩ��.
            EXISTS (
                SELECT 1
                FROM
                    MyRule_UserAccessAbleModel(@userID) AS UAAM
                WHERE
                    UAAM.module_id = mr_action.module_id
            )        
)
GO



---------------------------------------------------------------
-- SELECT * FROM MyRule_UserAccessAbleAction(1, 4);
-- SELECT * FROM MyRule_UserAccessAbleAction(2, 4);
---------------------------------------------------------------

