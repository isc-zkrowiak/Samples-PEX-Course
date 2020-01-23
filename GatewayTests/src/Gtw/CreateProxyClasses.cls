Class JavaGatewayTest.CreateProxyClasses Extends %Persistent
{

ClassMethod run()
{
   // get a connection to the Java Gateway
   set gwyConn = ##class(%Net.Remote.Gateway).%New()
   set status = gwyConn.%Connect("127.0.0.1", 44444, "INTEROP")
   if $$$ISERR(status) {
                write !,"error: "_$system.OBJ.DisplayError(status)
                quit
   }

   // add the jar to the classpath
   set classpath = ##class(%ListOfDataTypes).%New()
   do classpath.Insert("/datavol/GatewayTests")
   set status = gwyConn.%AddToCurrentClassPath(classpath)
   if $$$ISERR(status) {
                write !,"error: "_$system.OBJ.DisplayError(status)
                quit
   }

   // create the proxy ObjectScript classes that correspond to the Java classes in the jar file
   set status = gwyConn.%Import("Person",,,,1)
   if $$$ISERR(status) {
                write !,"error: "_$system.OBJ.DisplayError(status)
                quit
   }

   // close the connection to the Java gateway
   set status = gwyConn.%Disconnect()
   if $$$ISERR(status) {
                write !,"error: "_$system.OBJ.DisplayError(status)
                quit
   }
}

Storage Default
{
<Data name="CreateProxyClassesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^JavaGatewa7C5A.CreateProxy5802D</DataLocation>
<DefaultData>CreateProxyClassesDefaultData</DefaultData>
<IdLocation>^JavaGatewa7C5A.CreateProxy5802D</IdLocation>
<IndexLocation>^JavaGatewa7C5A.CreateProxy5802I</IndexLocation>
<StreamLocation>^JavaGatewa7C5A.CreateProxy5802S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
