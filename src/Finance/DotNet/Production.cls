Class Finance.DotNet.Production Extends Ens.Production
{

ClassMethod OnStart() As %Status
{
  set st =  ##class(Setup.GatewayMaker).StartGateway()

  return st
}

ClassMethod OnStop() As %Status
{

  Do ##class(Setup.GatewayMaker).StopGateway()

  return 1
}

XData ProductionDefinition
{
<Production Name="Finance.DotNet.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="ToPayFromOperation" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ToPayFromBank</Setting>
    <Setting Target="Host" Name="%remoteSettings">FilePath=/datavol/data/FromBankOut/</Setting>
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">/datavol/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
  </Item>
  <Item Name="ToPayToOperation" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ToPayToBank</Setting>
    <Setting Target="Host" Name="%remoteSettings">FilePath=/datavol/data/ToBankOut/</Setting>
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">/datavol/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
  </Item>
  <Item Name="ProcessPaymentRequest" Category="" ClassName="EnsLib.PEX.BusinessProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ProcessPaymentRequest</Setting>
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">/datavol/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
  </Item>
  <Item Name="FromFileService" Category="" ClassName="EnsLib.PEX.BusinessService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.FromFileTransaction</Setting>
    <Setting Target="Host" Name="%remoteSettings">TargetComponentNames=ProcessPaymentRequest
InboundFilePath=/datavol/data/in/</Setting>
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">/datavol/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
  </Item>
</Production>
}

}
