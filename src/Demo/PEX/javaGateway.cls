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
        set gw.ClassPath ="/datavol/PEX/bin/*:/datavol/PEX/Java/bin"
        set gw.Type = "1" //represents java gateway type
        set gw.Name = ..#NAME
        #; set gw.LogFile = "/JavaLog.txt" 
        set st = gw.%Save()
        if (st '=1) {
            return st
        }
        #; set st = ##class(%Net.Remote.Service).StartGateway(..#NAME,1)
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

ClassMethod startDotNet() As %Status
{
       
        #dim gw As %Net.Remote.ObjectGateway 

        set gw = ##class(%Net.Remote.ObjectGateway).%New()
        set gw.Port = "44446"
        set gw.DotNetVersion = "Core2.1"
        set gw.Server = "0.0.0.0"
        set gw.Exec64 = 1
        set gw.Type = "2" //represents dotnet gateway type
        set gw.Name = "DotNetGateway2"
        #; set gw.LogFile = "/JavaLog.txt" 
        set st = gw.%Save()
        if (st '=1) {
            return st
        }
        set st = ##class(%Net.Remote.Service).StartGateway("DotNetGateway2",1)
    Return st
}

}
