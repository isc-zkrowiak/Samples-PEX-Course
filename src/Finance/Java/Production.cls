Class Finance.Java.Production Extends Ens.Production
{

ClassMethod OnStart() As %Status
{
  set GatewayName = ##class(Setup.GatewayMaker).#JAVANAME
  set st =  ##class(%Net.Remote.Service).StartGateway(GatewayName,1)
  return st
}

ClassMethod OnStop() As %Status
{
  set GatewayName = ##class(Setup.GatewayMaker).#JAVANAME
  set st = ##class(%Net.Remote.Service).StopGateway(GatewayName,1)
  return st
}

XData ProductionDefinition
{
<Production Name="Finance.Java.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="ToPayFromOperation" Category="" ClassName="Finance.OutboundPEX" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ToPayFromBank</Setting>
    <Setting Target="Host" Name="%remoteSettings"></Setting>
    <Setting Target="Adapter" Name="%remoteClassname">Finance.PEXOutboundAdapter</Setting>
    <Setting Target="Adapter" Name="%remoteSettings">FilePath=/datavol/data/FromBankOut</Setting>
  </Item>
  <Item Name="ToPayToOperation" Category="" ClassName="Finance.OutboundPEX" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ToPayToBank</Setting>
    <Setting Target="Host" Name="%remoteSettings"></Setting>
    <Setting Target="Adapter" Name="%remoteClassname">Finance.PEXOutboundAdapter</Setting>
    <Setting Target="Adapter" Name="%remoteSettings">FilePath=/datavol/data/ToBankOut</Setting>
  </Item>
  <Item Name="ProcessPaymentRequest" Category="" ClassName="EnsLib.PEX.BusinessProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ProcessPaymentRequest</Setting>
  </Item>
  <Item Name="FromFileService" Category="" ClassName="Finance.InboundPEX" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.FromFileTransaction</Setting>
    <Setting Target="Host" Name="%remoteSettings">TargetComponentNames=ProcessPaymentRequest</Setting>
    <Setting Target="Adapter" Name="%remoteClassname">Finance.PEXInboundAdapter</Setting>
    <Setting Target="Adapter" Name="%remoteSettings">InboundFilePath=/datavol/data/in</Setting>
  </Item>
</Production>
}

}
