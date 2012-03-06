/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_permission')
  DROP TABLE mr_permission
go

CREATE TABLE mr_permission(
  permission_id int NOT NULL ,
  permission_name nvarchar(20) NOT NULL ,
  permission_desc nvarchar(100)
  CONSTRAINT PK_mr_permission PRIMARY KEY(permission_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', 'Ȩ�ޱ�',  N'user',  N'dbo',  N'Table', N'mr_permission', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'Ȩ�ޱ��(λ���㣬ֻ�� 1,2,4,8...)',   N'user',  N'dbo',  N'Table', N'mr_permission', N'column' , N'permission_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'Ȩ����',   N'user',  N'dbo',  N'Table', N'mr_permission', N'column' , N'permission_name';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'Ȩ������',   N'user',  N'dbo',  N'Table', N'mr_permission', N'column' , N'permission_desc';
go






/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_dept')
  DROP TABLE mr_dept
go

CREATE TABLE mr_dept(
  dept_id int IDENTITY(1,1)  NOT NULL ,
  parent_id int,
  dept_name nvarchar(20) NOT NULL ,
  dept_type varchar(10) NOT NULL ,
  status smallint NOT NULL  DEFAULT 1
  CONSTRAINT PK_mr_dept PRIMARY KEY(dept_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '����',  N'user',  N'dbo',  N'Table', N'mr_dept', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '����(������)',   N'user',  N'dbo',  N'Table', N'mr_dept', N'column' , N'dept_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�ϼ����ű��',   N'user',  N'dbo',  N'Table', N'mr_dept', N'column' , N'parent_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '������',   N'user',  N'dbo',  N'Table', N'mr_dept', N'column' , N'dept_name';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��������(ʵ�岿�š����ⲿ�š����е�)',   N'user',  N'dbo',  N'Table', N'mr_dept', N'column' , N'dept_type';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '״̬',   N'user',  N'dbo',  N'Table', N'mr_dept', N'column' , N'status';
go

ALTER TABLE mr_dept ADD CONSTRAINT FK_mr_dept_parent_id  FOREIGN KEY (parent_id)  REFERENCES  mr_dept
go









/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_user')
  DROP TABLE mr_user
go

CREATE TABLE mr_user(
  user_id int IDENTITY(1,1)  NOT NULL ,
  user_name nvarchar(20) NOT NULL ,
  status smallint NOT NULL  DEFAULT 1
  CONSTRAINT PK_mr_user PRIMARY KEY(user_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '�û�',  N'user',  N'dbo',  N'Table', N'mr_user', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '����(������)',   N'user',  N'dbo',  N'Table', N'mr_user', N'column' , N'user_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�û���',   N'user',  N'dbo',  N'Table', N'mr_user', N'column' , N'user_name';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '״̬',   N'user',  N'dbo',  N'Table', N'mr_user', N'column' , N'status';
go







/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_dept_user')
  DROP TABLE mr_dept_user
go

CREATE TABLE mr_dept_user(
  dept_id int NOT NULL ,
  user_id int NOT NULL ,
  permission_data int NOT NULL  DEFAULT 1
  CONSTRAINT PK_mr_dept_user PRIMARY KEY(dept_id, user_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '����-�û���ϵ',  N'user',  N'dbo',  N'Table', N'mr_dept_user', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '���ű��',   N'user',  N'dbo',  N'Table', N'mr_dept_user', N'column' , N'dept_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�û����',   N'user',  N'dbo',  N'Table', N'mr_dept_user', N'column' , N'user_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'Ȩ�����ݣ�ʹ��λ���㴦��',   N'user',  N'dbo',  N'Table', N'mr_dept_user', N'column' , N'permission_data';
go

ALTER TABLE mr_dept_user ADD CONSTRAINT FK_mr_dept_user_dept_id  FOREIGN KEY (dept_id)  REFERENCES  mr_dept
go

ALTER TABLE mr_dept_user ADD CONSTRAINT FK_mr_dept_user_user_id  FOREIGN KEY (user_id)  REFERENCES  mr_user
go








/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_module')
  DROP TABLE mr_module
go

CREATE TABLE mr_module(
  module_id int IDENTITY(1,1)  NOT NULL ,
  parent_id int,
  module_name nvarchar(20) NOT NULL ,
  status smallint NOT NULL  DEFAULT 1
  CONSTRAINT PK_mr_module PRIMARY KEY(module_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '����ģ��',  N'user',  N'dbo',  N'Table', N'mr_module', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '����(������)',   N'user',  N'dbo',  N'Table', N'mr_module', N'column' , N'module_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ģ����',   N'user',  N'dbo',  N'Table', N'mr_module', N'column' , N'parent_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'ģ������',   N'user',  N'dbo',  N'Table', N'mr_module', N'column' , N'module_name';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '״̬',   N'user',  N'dbo',  N'Table', N'mr_module', N'column' , N'status';
go

ALTER TABLE mr_module ADD CONSTRAINT FK_mr_module_parent_id  FOREIGN KEY (parent_id)  REFERENCES  mr_module
go







/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_action')
  DROP TABLE mr_action
go

CREATE TABLE mr_action(
  action_id int IDENTITY(1,1)  NOT NULL ,
  module_id int NOT NULL ,
  action_name nvarchar(20) NOT NULL ,
  default_rule tinyint NOT NULL  DEFAULT 0,
  status smallint NOT NULL  DEFAULT 1
  CONSTRAINT PK_mr_action PRIMARY KEY(action_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', 'ģ�鶯��',  N'user',  N'dbo',  N'Table', N'mr_action', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '����(������)',   N'user',  N'dbo',  N'Table', N'mr_action', N'column' , N'action_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'ģ����',   N'user',  N'dbo',  N'Table', N'mr_action', N'column' , N'module_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'ģ������',   N'user',  N'dbo',  N'Table', N'mr_action', N'column' , N'action_name';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'Ĭ�Ͽ��ñ�־',   N'user',  N'dbo',  N'Table', N'mr_action', N'column' , N'default_rule';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '״̬',   N'user',  N'dbo',  N'Table', N'mr_action', N'column' , N'status';
go

ALTER TABLE mr_action ADD CONSTRAINT FK_mr_action_module_id  FOREIGN KEY (module_id)  REFERENCES  mr_module
go








/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_user_module')
  DROP TABLE mr_user_module
go

CREATE TABLE mr_user_module(
  user_id int NOT NULL ,
  module_id int NOT NULL 
  CONSTRAINT PK_mr_user_module PRIMARY KEY(user_id, module_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '�û�-ģ���ϵ',  N'user',  N'dbo',  N'Table', N'mr_user_module', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�û����',   N'user',  N'dbo',  N'Table', N'mr_user_module', N'column' , N'user_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'ģ����',   N'user',  N'dbo',  N'Table', N'mr_user_module', N'column' , N'module_id';
go

ALTER TABLE mr_user_module ADD CONSTRAINT FK_mr_user_module_user_id  FOREIGN KEY (user_id)  REFERENCES  mr_user
go

ALTER TABLE mr_user_module ADD CONSTRAINT FK_mr_user_module_module_id  FOREIGN KEY (module_id)  REFERENCES  mr_module
go







/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_user_action')
  DROP TABLE mr_user_action
go

CREATE TABLE mr_user_action(
  user_id int NOT NULL ,
  action_id int NOT NULL 
  CONSTRAINT PK_mr_user_action PRIMARY KEY(user_id, action_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '�û�-������ϵ',  N'user',  N'dbo',  N'Table', N'mr_user_action', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�û����',   N'user',  N'dbo',  N'Table', N'mr_user_action', N'column' , N'user_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�������',   N'user',  N'dbo',  N'Table', N'mr_user_action', N'column' , N'action_id';
go

ALTER TABLE mr_user_action ADD CONSTRAINT FK_mr_user_action_user_id  FOREIGN KEY (user_id)  REFERENCES  mr_user
go

ALTER TABLE mr_user_action ADD CONSTRAINT FK_mr_user_action_action_id  FOREIGN KEY (action_id)  REFERENCES  mr_action
go








/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_role')
  DROP TABLE mr_role
go

CREATE TABLE mr_role(
  role_id int IDENTITY(1,1)  NOT NULL ,
  role_name nvarchar(20) NOT NULL ,
  status smallint NOT NULL  DEFAULT 1
  CONSTRAINT PK_mr_role PRIMARY KEY(role_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '��ɫ',  N'user',  N'dbo',  N'Table', N'mr_role', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '����(������)',   N'user',  N'dbo',  N'Table', N'mr_role', N'column' , N'role_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ɫ����',   N'user',  N'dbo',  N'Table', N'mr_role', N'column' , N'role_name';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '״̬',   N'user',  N'dbo',  N'Table', N'mr_role', N'column' , N'status';
go








/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_user_role')
  DROP TABLE mr_user_role
go

CREATE TABLE mr_user_role(
  user_id int NOT NULL ,
  role_id int NOT NULL 
  CONSTRAINT PK_mr_user_role PRIMARY KEY(user_id, role_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '�û�-��ɫ��ϵ',  N'user',  N'dbo',  N'Table', N'mr_user_role', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�û����',   N'user',  N'dbo',  N'Table', N'mr_user_role', N'column' , N'user_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ɫ���',   N'user',  N'dbo',  N'Table', N'mr_user_role', N'column' , N'role_id';
go

ALTER TABLE mr_user_role ADD CONSTRAINT FK_mr_user_role_user_id  FOREIGN KEY (user_id)  REFERENCES  mr_user
go

ALTER TABLE mr_user_role ADD CONSTRAINT FK_mr_user_role_role_id  FOREIGN KEY (role_id)  REFERENCES  mr_role
go






/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_role_module')
  DROP TABLE mr_role_module
go

CREATE TABLE mr_role_module(
  role_id int NOT NULL ,
  module_id int NOT NULL 
  CONSTRAINT PK_mr_role_module PRIMARY KEY(role_id, module_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '��ɫ-ģ���ϵ',  N'user',  N'dbo',  N'Table', N'mr_role_module', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ɫ���',   N'user',  N'dbo',  N'Table', N'mr_role_module', N'column' , N'role_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', 'ģ����',   N'user',  N'dbo',  N'Table', N'mr_role_module', N'column' , N'module_id';
go

ALTER TABLE mr_role_module ADD CONSTRAINT FK_mr_role_module_role_id  FOREIGN KEY (role_id)  REFERENCES  mr_role
go

ALTER TABLE mr_role_module ADD CONSTRAINT FK_mr_role_module_module_id  FOREIGN KEY (module_id)  REFERENCES  mr_module
go








/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_role_action')
  DROP TABLE mr_role_action
go

CREATE TABLE mr_role_action(
  role_id int NOT NULL ,
  action_id int NOT NULL 
  CONSTRAINT PK_mr_role_action PRIMARY KEY(role_id, action_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '��ɫ-������ϵ',  N'user',  N'dbo',  N'Table', N'mr_role_action', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ɫ���',   N'user',  N'dbo',  N'Table', N'mr_role_action', N'column' , N'role_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '�������',   N'user',  N'dbo',  N'Table', N'mr_role_action', N'column' , N'action_id';
go

ALTER TABLE mr_role_action ADD CONSTRAINT FK_mr_role_action_role_id  FOREIGN KEY (role_id)  REFERENCES  mr_role
go

ALTER TABLE mr_role_action ADD CONSTRAINT FK_mr_role_action_action_id  FOREIGN KEY (action_id)  REFERENCES  mr_action
go




















/* SQL Server �������  */ 
IF EXISTS(SELECT * FROM sys.Tables WHERE name='mr_demo_data')
  DROP TABLE mr_demo_data
go

CREATE TABLE mr_demo_data(
  demo_id int IDENTITY(1,1)  NOT NULL ,
  city_id int NOT NULL ,
  dept_id int NOT NULL ,
  demo_info varchar(30)
  CONSTRAINT PK_mr_demo_data PRIMARY KEY(demo_id )
);
go

EXECUTE sp_addextendedproperty N'MS_Description', '��ʾ����',  N'user',  N'dbo',  N'Table', N'mr_demo_data', NULL, NULL;
go

EXECUTE sp_addextendedproperty   N'MS_Description', '����(������)',   N'user',  N'dbo',  N'Table', N'mr_demo_data', N'column' , N'demo_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '���б��',   N'user',  N'dbo',  N'Table', N'mr_demo_data', N'column' , N'city_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '���ű��',   N'user',  N'dbo',  N'Table', N'mr_demo_data', N'column' , N'dept_id';
go

EXECUTE sp_addextendedproperty   N'MS_Description', '��ʾ����',   N'user',  N'dbo',  N'Table', N'mr_demo_data', N'column' , N'demo_info';
go

