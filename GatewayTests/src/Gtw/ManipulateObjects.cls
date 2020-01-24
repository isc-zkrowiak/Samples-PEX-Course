Class JavaGatewayTest.ManipulateObjects Extends %Persistent
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

   // manipulate some proxy objects
   set person = ##class(User.Person).%New(gwyConn,5,"Tom")
   write !,"Name: "_person.getName()
   write !,"Age: "_person.getAge()
   write !,"setting age to 100"
   do person.setAge(100)
   write !,"Age: "_person.getAge()

   // close the connection to the Java Gateway
   set status = gwyConn.%Disconnect()
   if $$$ISERR(status) {
                write !,"error:"_$system.OBJ.DisplayError(status)
                quit
   }
}

Storage Default
{
<Data name="ManipulateObjectsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^JavaGatewa7C5A.ManipulateO7E1DD</DataLocation>
<DefaultData>ManipulateObjectsDefaultData</DefaultData>
<IdLocation>^JavaGatewa7C5A.ManipulateO7E1DD</IdLocation>
<IndexLocation>^JavaGatewa7C5A.ManipulateO7E1DI</IndexLocation>
<StreamLocation>^JavaGatewa7C5A.ManipulateO7E1DS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
