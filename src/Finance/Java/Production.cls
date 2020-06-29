Class Finance.Java.Production Extends Ens.Production
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
<Production Name="Finance.Java.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="ToPayFromOperation" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ToPayFromBank</Setting>
    <Setting Target="Host" Name="%remoteSettings">FilePath=/datavol/data/FromBankOut</Setting>
  </Item>
  <Item Name="ToPayToOperation" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ToPayToBank</Setting>
    <Setting Target="Host" Name="%remoteSettings">FilePath=/datavol/data/ToBankOut</Setting>
  </Item>
  <Item Name="ProcessPaymentRequest" Category="" ClassName="EnsLib.PEX.BusinessProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ProcessPaymentRequest</Setting>
  </Item>
  <Item Name="FromFileService" Category="" ClassName="EnsLib.PEX.BusinessService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.FromFileTransaction</Setting>
    <Setting Target="Host" Name="%remoteSettings">TargetComponentNames=ProcessPaymentRequest
InboundFilePath=/datavol/data/in</Setting>
  </Item>
</Production>
}

}
