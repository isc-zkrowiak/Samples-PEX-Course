Class Demo.PEX.javaGateway
{

Parameter NAME = "JavaGateway2";

ClassMethod startGateway() As %Status
{
       
        #dim gw As %Net.Remote.ObjectGateway 

        set gw = ##class(%Net.Remote.ObjectGateway).%New()
        set gw.Port = "44444"
        set gw.JavaHome = "/usr/lib/jvm/java-8-openjdk-amd64/jre"
        set gw.Server = "0.0.0.0"
        set gw.ClassPath ="/datavol/PEX/bin/intersystems-gateway-3.1.0.jar:" _
            "/datavol/PEX/bin/intersystems-jdbc-3.1.0.jar:"
            _"/datavol/PEX/bin/gson-2.8.5.jar:"
            _"/datavol/PEX/Java/bin"
        set gw.Type = "1" //represents java gateway type
        set gw.Name = ..#NAME
        #; set gw.LogFile = "/JavaLog.txt" 
        set st = gw.%Save()
        if (st '=1) {
            return st
        }
        set st = ##class(%Net.Remote.Service).StartGateway(..#NAME,1)
    Return st
}

ClassMethod Restart() As %Status
{
    set st =  ##class(%Net.Remote.Service).StopGateway(..#NAME)
    if (st =1){
        set st = ##class(%Net.Remote.Service).StartGateway(..#NAME)
        return st
    }
    return st
}

}
