开发步骤:


做此操作以前，先在 SQL Server 上面的 Test 数据库上面，创建2个测试表。  sql 文件为本目录下的 db.sql
（如果没有 Test 数据库，那么创建一个）


================================================================================

1. 	创建 MyWcfServiceLibrary 项目。 
1.1. 项目类型为 WCF 服务库
1.2. 在这个项目中，增加一个  ADO.NET 实体数据模型 TestModel.edmx
1.2.1.	选择 “从数据库生成”，按 “下一步”。
1.2.2.	下拉列表中选择 测试数据库的 连接 （如果没有，那么新建一个），按 “下一步”。
1.2.3.	在“选择数据库对象”中， 选择 test_main 表和 test_sub 表，按 “完成”按钮。
1.2.4.	在 TestModel.edmx 设置窗口空白区域， 鼠标右键， 弹出菜单中选择 “添加代码生成项”。
1.2.5.	然后选择 “联机模板”， 找到一个  “ADO.NET C# POCO Entity Generator With WCF Support” 的模板， 命名为“TestModel.tt” ，做添加的处理。
1.2.6.	安全警告窗口， 按 “确定”。 （可能要按两次）
1.2.7.	关闭 TestModel.edmx 窗口.
1.3. 修改 TestModel.Context.tt 文件。 修改构造函数上的处理逻辑，增加  不使用代理类 的代码.  [重要]
1.4. 修改 IService1.cs 与 Service1.cs , 新增调用 Entity Framework ， 返回数据列表的方法.


================================================================================

2.	创建 MyWcfClient 项目。 
2.1. 项目类型 控制台应用程序。
2.2. 项目添加 “服务引用”， 弹出窗口后， 按 “发现” 按钮进行处理。
2.3. 编写 Program.cs，调用 WCF 服务 （此模式下创建的 app.config ， 仅用于 VS2010 开发环境下测试使用 ）
2.4. 测试运行， 观察 WCF 是否能调用成功。

