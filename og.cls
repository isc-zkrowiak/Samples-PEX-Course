set st = ##class(%Net.Remote.Service).OpenGateway("DotNetGateway2",.OG)

set Path = ##class(%ListOfDataTypes).%New()
do Path.Insert("/datavol/PEX/testNet/bin/Debug/netcoreapp2.1/testNet.dll")
set GW = ##class(%Net.Remote.Gateway).%New()
set st = GW.%Connect(OG.Server, OG.Port, "INTEROP",,Path)
set proxyFruit = ##class(%Net.Remote.Object).%New(GW,"Fruit")


set st = GW.%GetAllClasses("/datavol/PEX/testNet/bin/Debug/netcoreapp2.1/testNet.dll", .AC)

set st = GW.%GetAllClasses("/usr/irissys/dev/dotnet/bin/Core21/Gateway/IRISGatewayCore21.dll", .AC)