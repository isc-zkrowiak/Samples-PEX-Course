Class Finance.Production Extends Ens.Production
{

ClassMethod OnStart() As %Status
{
  set st =  ##class(%Net.Remote.Service).StartGateway("JavaGateway",1)


  return st
}

ClassMethod OnStop()
{

  set st = ##class(%Net.Remote.Service).StopGateway("JavaGateway",1)
}

XData ProductionDefinition
{
<Production Name="Finance.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="FromPdfFile" Category="" ClassName="EnsLib.PEX.BusinessService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">finance.PexService</Setting>
    <Setting Target="Host" Name="%remoteSettings">targetConfigNames=Finance.BusinessBPL
filePath=/datavol/data/in/2017Sample.pdf</Setting>
  </Item>
  <Item Name="Finance.BusinessBPL" Category="" ClassName="Finance.BusinessBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
