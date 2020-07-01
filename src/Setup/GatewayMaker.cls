Class Setup.GatewayMaker
{

Parameter JAVANAME = "JavaGateway";

Parameter DOTNETNAME = "DotNetGateway";

ClassMethod StartGateway() As %Status
{
       
        set st = ##class(%Net.Remote.Service).StartGateway(..#JAVANAME,1)

        if ($System.Status.IsError(st)) {return st}
        set st = ##class(%Net.Remote.Service).StartGateway(..#DOTNETNAME,1)
        return st
}

ClassMethod StopGateway() As %Status
{
    do ##class(%Net.Remote.Service).StopGateway(..#JAVANAME)
    do ##class(%Net.Remote.Service).StopGateway(..#DOTNETNAME)
}

ClassMethod BuildJavaGateway() As %Status
{
    #dim gw As %Net.Remote.ObjectGateway 

        set gw = ##class(%Net.Remote.ObjectGateway).%New()
        set gw.Port = "44444"
        set gw.JavaHome = ##class(%SYSTEM.Util).GetEnviron("JAVA_HOME")
        set gw.Server = "0.0.0.0"
        set gw.ClassPath =  ##class(%SYSTEM.Util).GetEnviron("CLASSPATH")
        set gw.Type = "1" //represents java gateway type
        set gw.Name = ..#JAVANAME
        #; set gw.LogFile = "/JavaLog.txt" 
        set st = gw.%Save()
        if (st '=1) {
            return st
        }
        
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

ClassMethod BuildDotNetGateway() As %Status
{
       
        #dim gw As %Net.Remote.ObjectGateway 

        set gw = ##class(%Net.Remote.ObjectGateway).%New()
        set gw.Port = "55555"
        set gw.DotNetVersion = "Core2.0"
        set gw.Server = "0.0.0.0"
        set gw.Exec64 = 1
        set gw.Type = "2" //represents dotnet gateway type
        set gw.Name = ..#DOTNETNAME
        set gw.LogFile = "/dotnetLog.txt" 
        set st = gw.%Save()
        if (st '=1) {
            return st
        }
       
    Return st
}

ClassMethod BuildGateways() As %Status
{
    set st = ..BuildDotNetGateway()
    $$$ThrowOnError(st)
    set st= ..BuildJavaGateway()
    $$$ThrowOnError(st)
    return st
}

}
