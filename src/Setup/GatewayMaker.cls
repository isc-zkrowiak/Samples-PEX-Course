Class Setup.GatewayMaker
{

Parameter JAVANAME = "JavaGateway";

Parameter DOTNETNAME = "DotNetGateway";

ClassMethod StartGateway() As %Status
{
       
        do ..StartJavaGateway()
        do ..StartDotNetGateway()
}

ClassMethod StartJavaGateway() As %Status
{
    #dim gw As %Net.Remote.ObjectGateway 

        set gw = ##class(%Net.Remote.ObjectGateway).%New()
        set gw.Port = "44444"
        set gw.JavaHome = "/usr/lib/jvm/java-8-openjdk-amd64/jre"
        set gw.Server = "0.0.0.0"
        set gw.ClassPath ="/datavol/Java/lib/*:/datavol/Java/bin:/usr/irissys/dev/java/lib/jackson/jackson-core-2.10.2.jar:/usr/irissys/dev/java/lib/JDK18/*"
        set gw.Type = "1" //represents java gateway type
        set gw.Name = ..#JAVANAME
        #; set gw.LogFile = "/JavaLog.txt" 
        set st = gw.%Save()
        if (st '=1) {
            return st
        }
        set st = ##class(%Net.Remote.Service).StartGateway(..#JAVANAME,1)
    Return st
}

ClassMethod Restart() As %Status
{
    set st =  ##class(%Net.Remote.Service).StopGateway(..#JAVANAME)
    if (st =1){
        set st = ##class(%Net.Remote.Service).StartGateway(..#JAVANAME)
        return st
    }
    return st
}

ClassMethod StartDotNetGateway() As %Status
{
       
        #dim gw As %Net.Remote.ObjectGateway 

        set gw = ##class(%Net.Remote.ObjectGateway).%New()
        set gw.Port = "55555"
        set gw.DotNetVersion = "Core2.1"
        set gw.Server = "0.0.0.0"
        set gw.Exec64 = 1
        set gw.Type = "2" //represents dotnet gateway type
        set gw.Name = ..#DOTNETNAME
        set gw.LogFile = "/dotnetLog.txt" 
        set st = gw.%Save()
        if (st '=1) {
            return st
        }
        set st = ##class(%Net.Remote.Service).StartGateway(..#DOTNETNAME,1)
    Return st
}

}
