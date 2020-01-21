IF "%irisroot%"=="" (set irisroot=c:\intersystems\iris)

copy %irisroot%\dev\java\lib\JDK18\intersystems-jdbc-*.jar
copy %irisroot%\dev\java\lib\JDK18\intersystems-gateway-*.jar
copy %irisroot%\dev\java\lib\gson\gson-2.8.5.jar

copy %irisroot%\dev\dotnet\bin\v4.5\InterSystems.Data.IRISClient.dll
copy %irisroot%\dev\dotnet\bin\v4.5\InterSystems.Data.Gateway.exe

copy ..\Java\target\intersystems-PEX-demo-*.jar
copy ..\DotNet\bin\Debug\DemoPEX.exe