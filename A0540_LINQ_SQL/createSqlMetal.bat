path C:\Program Files\Microsoft SDKs\Windows\v6.0A\bin

REM ���ڱ����� sqlexpress �������ϵ� test ���ݿ� ��� ���� , Դ����Ϊ C#, �����ռ�Ϊ A0540_LINQ_SQL.Sample
sqlmetal /server:.\sqlexpress /database:test /map:Test.map /code:Test.cs /language:C# /namespace:A0540_LINQ_SQL.Sample

