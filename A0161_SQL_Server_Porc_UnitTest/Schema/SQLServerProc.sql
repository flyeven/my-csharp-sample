/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='my_serial_number')
  DROP TABLE my_serial_number
go

CREATE TABLE my_serial_number(
  sn_id int IDENTITY(1,1)  NOT NULL ,
  sn_name nvarchar(20) NOT NULL ,
  sn_desc nvarchar(50),
  sn_howto nvarchar(20) NOT NULL ,
  sn_format nvarchar(50) NOT NULL ,
  sn_seq_max int NOT NULL  DEFAULT 9999,
  sn_seq_min int NOT NULL  DEFAULT 1,
  sn_seq_curr int NOT NULL  DEFAULT 1,
  sn_date_curr datetime,
  sn_curr_val nvarchar(50),
  sn_auto_close_date BIT
  CONSTRAINT PK_my_serial_number PRIMARY KEY(sn_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '��ˮ������',  N'user',  N'dbo',  N'Table', N'my_serial_number', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ�ű�� ����(������)',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ������',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_name';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ��������Ϣ',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_desc';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ�Ŵ�����ʽ',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_howto';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ��������Ϣ',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_format';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ������ŵ����ֵ',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_seq_max';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ������ŵ���Сֵ',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_seq_min';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ������ŵĵ�ǰֵ',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_seq_curr';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ˮ������ŵĵ�ǰ����/ʱ��',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_date_curr';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ǰ��ˮ��',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_curr_val';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�Ƿ��Զ���������л�(�Զ��ģ������ڷ����仯������Զ����»ص�1�Ĵ���)',   N'user',  N'dbo',  N'Table', N'my_serial_number', N'column' , N'sn_auto_close_date';
go



-- ����Ҫ Ψһ.
ALTER TABLE my_serial_number
   ADD CONSTRAINT un_my_serial_number
       UNIQUE (sn_name);






IF EXISTS(SELECT * FROM dbo.sysobjects WHERE
    xtype IN ('IF', 'TF', 'FN')
    AND OBJECTPROPERTY(id, N'IsMSShipped') = 0
    AND name='MySerialNumber_FormatVal')
  DROP FUNCTION MySerialNumber_FormatVal
GO


-- =============================================
-- Author:		Edward Wang
-- Description:	���ڸ�ʽ�����к�.
-- =============================================
CREATE FUNCTION MySerialNumber_FormatVal (
  @sn_format              NVARCHAR(50),     -- ��ˮ��������Ϣ
  @sn_date_curr           DATETIME,         -- ��ˮ������ŵĵ�ǰ����/ʱ��
  @sn_seq_curr            INT               -- ��ˮ������ŵĵ�ǰֵ
) RETURNS NVARCHAR(50)
AS
BEGIN

  DECLARE
    @startIndex     INT,                    -- ��ʼ����.
    @finishIndex    INT,                    -- ��������.
    @seqLength      INT,                    -- ���кų���.
    @seqString      NVARCHAR(50),           -- ׼�������滻�����к���Ϣ
    @formatResult   NVARCHAR(50);           -- Ԥ�ڽ��.


  IF @sn_format IS NULL
  BEGIN
    -- ��ˮ��������ϢΪ��.
    RETURN NULL;
  END

  IF @sn_date_curr IS NULL
  BEGIN
    -- ��ˮ�� ��ǰ����/ʱ�� Ϊ��.
    SET @sn_date_curr = GETDATE();
  END

  IF @sn_seq_curr IS NULL
  BEGIN
    -- ��ˮ�� ��� Ϊ��.
    SET @sn_seq_curr = 1;
  END

  -- ���ȼ����� ��� = ��ʽ
  SET @formatResult = @sn_format;



  -- ����滻 ������.
  IF CHARINDEX('[@Today:YYYYMMDD]', @formatResult)  > 0
  BEGIN
    SET @formatResult =
      REPLACE(  @formatResult,
                '[@Today:YYYYMMDD]',
                Convert(VARCHAR(8), @sn_date_curr,  112 )  );
  END

  -- ����滻 ����.
  IF CHARINDEX('[@Today:YYYYMM]', @formatResult)  > 0
  BEGIN
    SET @formatResult =
      REPLACE(  @formatResult,
                '[@Today:YYYYMM]',
                Convert(VARCHAR(6), @sn_date_curr,  112 )  );
  END

  -- ����滻 ��.
  IF CHARINDEX('[@Today:YYYY]', @formatResult)  > 0
  BEGIN
    SET @formatResult =
      REPLACE(  @formatResult,
                '[@Today:YYYY]',
                Convert(VARCHAR(4), @sn_date_curr,  112 )  );
  END


  -- ��λ ���к� ��ʼ��־.
  SET @startIndex = CHARINDEX('[@Seq:', @formatResult);
  IF @startIndex > 0
  BEGIN
    -- ��λ ���к� ������־.
    SET @finishIndex = CHARINDEX(']', @formatResult, @startIndex);
    IF @finishIndex > 0
    BEGIN
      -- ���� [@Seq:0000] ��Ϣ�е� [ �� ] ֮��� �ַ���.
      SET @seqLength = @finishIndex - @startIndex - 6;
      -- ��ȡ׼�������滻���ַ�����.
      SET @seqString = SUBSTRING(@formatResult, @startIndex, @seqLength + 7);
      -- ��ʽ�� �����Ϣ.
      SET @formatResult =
        REPLACE(@formatResult,
                @seqString,
                RIGHT(CAST(POWER(10, @seqLength) + @sn_seq_curr AS varchar(20)),@seqLength) );
    END
  END

  -- ����.
  RETURN @formatResult;

END
GO


----------
-- SELECT
--   dbo.MySerialNumber_FormatVal( '[@Today:YYYYMMDD]_[@Seq:0000]', GETDATE(), 123) AS A1,
--   dbo.MySerialNumber_FormatVal( '[@Today:YYYYMM]_[@Seq:0000]', GETDATE(), 12) AS A2,
--   dbo.MySerialNumber_FormatVal( '[@Today:YYYY]_[@Seq:0000]', GETDATE(), 123) AS A3,
--   dbo.MySerialNumber_FormatVal( '[@Today:YYYYMMDD]_[@Seq:00]', GETDATE(), 123) AS A4,
--   dbo.MySerialNumber_FormatVal( '[@Today:YYYYMMDD]_[@Seq:]', GETDATE(), 123) AS A5
----------








IF EXISTS(SELECT * FROM sys.procedures WHERE name='MySerialNumber_CurrVal')
  DROP PROCEDURE MySerialNumber_CurrVal
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Edward Wang
-- Description:	���ڻ�ȡ ��ǰ��ˮ��
-- =============================================
CREATE PROCEDURE MySerialNumber_CurrVal
  @snName       NVARCHAR(20),               -- ��ˮ������.
  @snResult     NVARCHAR(50)    OUTPUT      -- ��ǰ��ˮ��.
AS
BEGIN

  SET NOCOUNT ON;

  -- ��ѯ����.
  SELECT
    @snResult = sn_curr_val
  FROM
    my_serial_number
  WHERE
    sn_name = @snName;

  -- ���û�м��������ݣ���ô��Ҫ���ش���.
  IF (@@ROWCOUNT = 0)
  BEGIN
    -- ��ˮ��  ������.
    RAISERROR(
        N'��ˮ��(%s)�����ڡ�',
        16,
        1,
        @snName);
    RETURN;
  END;

  -- ��� ��ˮ�Ż�û�г�ʼ������ô��Ҫ���ش���.
  IF (@snResult IS NULL)
  BEGIN
    -- ��ˮ�Ż�û�г�ʼ��.
    RAISERROR(
        N'��ˮ��(%s)��δ��ʼ�������ȵ��� NextVal ��',
        0,
        1,
        @snName);
    RETURN;
  END;

END
GO



-----
-- DECLARE
--   @RC int,
--   @id  INT,
--   @resultVal NVARCHAR(50);
-- BEGIN
--   SET @id = 100;
--   EXECUTE @RC = MySerialNumber_CurrVal @id, @resultVal OUTPUT;
--   PRINT @RC;
--   PRINT @resultVal;
-- END
-- GO
-----







IF EXISTS(SELECT * FROM sys.procedures WHERE name='MySerialNumber_NextVal')
  DROP PROCEDURE MySerialNumber_NextVal
GO

-- =============================================
-- Author:		Edward Wang
-- Description:	���ڻ�ȡ ��һ����ˮ��
-- =============================================
CREATE PROCEDURE MySerialNumber_NextVal
  @snName       NVARCHAR(20),           -- ��ˮ������.
  @snResult     NVARCHAR(50)    OUTPUT  -- ��ǰ��ˮ��.
AS
BEGIN

  DECLARE
    @sn_format              NVARCHAR(50),       -- ��ˮ��������Ϣ
    @sn_seq_max             INT,                -- ��ˮ������ŵ����ֵ
    @sn_seq_min             INT,                -- ��ˮ������ŵ���Сֵ
    @sn_seq_curr            INT,                -- ��ˮ������ŵĵ�ǰֵ
    @sn_date_curr           DATETIME,           -- ��ˮ������ŵĵ�ǰ����/ʱ��
    @sn_curr_val            NVARCHAR(50),       -- ��ǰ��ˮ��
    @sn_auto_close_date     BIT;                -- �Ƿ��Զ���������л�(�Զ��ģ������ڷ����仯������Զ����»ص�1�Ĵ���)

  SET NOCOUNT ON;

  SELECT
    @sn_format          = sn_format
    ,@sn_seq_max         = sn_seq_max
    ,@sn_seq_min         = sn_seq_min
    ,@sn_seq_curr        = sn_seq_curr
    ,@sn_date_curr       = sn_date_curr
    ,@sn_curr_val        = sn_curr_val
    ,@sn_auto_close_date = sn_auto_close_date
  FROM
    my_serial_number
  WHERE
    sn_name = @snName;


  -- ���û�м��������ݣ���ô��Ҫ���ش���.
  IF (@@ROWCOUNT = 0)
  BEGIN
    -- ��ˮ�� ID ������.
    RAISERROR(
        N'��ˮ��(%s)�����ڡ�',
        16,
        1,
        @snName);
    RETURN;
  END;



  IF (@sn_curr_val IS NULL)
  BEGIN
    -- ��ˮ�Ż�û�г�ʼ��.
    -- ����Ҫ���Ƚϴ���.

    -- ���� ����ǰ����ʱ��.
    SET @sn_date_curr = GETDATE();

    -- ��ʽ�� ��ˮ��.
    SET @snResult =
      dbo.MySerialNumber_FormatVal(
        @sn_format,
        @sn_date_curr,
        @sn_seq_curr);

  END
  ELSE
  BEGIN
    -- �Ѿ����� ��ǰ��ˮ��
    -- ������Ҫ�� �ԱȵĴ���.
    IF ( @sn_auto_close_date = 1)
    BEGIN
      -- ��Ҫ�Զ���������.
      IF (dbo.MySerialNumber_FormatVal(@sn_format, GETDATE(), @sn_seq_curr)
            <> @sn_curr_val)
      BEGIN
        -- ��� ���յ�ǰ������ʱ�䣬 ������һ�ε� ��ˮ��
        -- ���� ���������һ�µ����
        -- ��ô��Ҫ���� ��ˮ�ŵ� ����ʱ�� ���� ������ûص� 1.

        SET @sn_date_curr = GETDATE();
        SET @sn_seq_curr = 1;
      END
      ELSE
      BEGIN
        -- ��� ���յ�ǰ������ʱ�䣬 ������һ�ε� ��ˮ��
        -- ��������һ�µ�
        -- ��ô��Ϊ�� ��ǰ�����ڣ� ���ϴεļ������ڣ�����ͬһ����Χ�ڵ�
        -- ֻ��Ҫ�� ������žͿ�����.
        SET @sn_seq_curr = @sn_seq_curr + 1;
      END
    END
    ELSE
    BEGIN
      -- ����Ҫ�Զ�����.
      -- ��ˮ�ŵ���.
      SET @sn_seq_curr = @sn_seq_curr + 1;
    END

    IF (@sn_seq_curr > @sn_seq_max)
    BEGIN
      -- ���к� ���� ���кŵ����ֵ.
      RAISERROR(
          N'��ˮ�ŵ���ų�������ŵ����ֵ��',
          16,
          1);
      RETURN;
    END

    -- ��ʽ�� ��ˮ��.
    SET @snResult =
      dbo.MySerialNumber_FormatVal(
        @sn_format,
        @sn_date_curr,
        @sn_seq_curr);

  END




  -- ���� �������к� �� ����.
  UPDATE
    my_serial_number
  SET
    sn_seq_curr   = @sn_seq_curr,
    sn_date_curr  = @sn_date_curr,
    sn_curr_val   = @snResult
  WHERE
    sn_name = @snName;


END
GO





-----
-- INSERT INTO [my_serial_number]
--            ([sn_name]
--            ,[sn_desc]
--            ,[sn_howto]
--            ,[sn_format]
--            ,[sn_seq_max]
--            ,[sn_seq_min]
--            ,[sn_seq_curr]
--            ,[sn_auto_close_date])
--      VALUES
--            ('TEST_SEQ'
--            ,'������ˮ��'
--            ,'Normal'
--            ,'X-[@Today:YYYYMMDD]_[@Seq:0000]'
--            ,9999
--            ,1
--            ,1
--            ,1)
-- GO
--
--


-- DECLARE
--   @RC int,
--   @resultVal NVARCHAR(50);
-- BEGIN
-- 
--   EXECUTE @RC = MySerialNumber_NextVal 'TEST_SEQ', @resultVal OUTPUT;
--   PRINT @RC;
--   PRINT @resultVal;
-- 
--   EXECUTE @RC = MySerialNumber_CurrVal 'TEST_SEQ', @resultVal OUTPUT;
--   PRINT @RC;
--   PRINT @resultVal;
-- END
-- GO

-----