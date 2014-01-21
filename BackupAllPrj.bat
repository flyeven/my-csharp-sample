SET bcpd=%date:/=%
PATH "C:\Program Files\7-Zip"

7z.exe a -r -x!bin -x!obj -x!.svn -x!Lib -x!packages my-csharp-sample.zip *.*

pause
