path C:\WINDOWS\Microsoft.NET\Framework\v3.5

REM �������� Entity Model

EdmGen /mode:FullGeneration /project:Test /namespace:A0610_EF.Sample /language:CSharp /provider:System.Data.SqlClient /connectionstring:"server=.\sqlexpress;integrated security=true;database=test"

pause