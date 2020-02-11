Class Demo.AllJava Extends Ens.Production
{

ClassMethod OnStart() As %Status
{
  set st =  ##class(%Net.Remote.Service).StartGateway("JavaGateway2")

  return st
}

XData ProductionDefinition
{
<Production Name="Demo.AllJava" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.PEX.BusinessService" Category="" ClassName="EnsLib.PEX.BusinessService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%gatewayPort">44444</Setting>
    <Setting Target="Host" Name="%remoteClassname">demo.InboundService</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths"></Setting>
    <Setting Target="Adapter" Name="CallInterval">1</Setting>
    <Setting Target="Host" Name="%gatewayHost">0.0.0.0</Setting>
    <Setting Target="Host" Name="%remoteSettings">inPath=/datavol/data/in
tNames=EnsLib.PEX.BusinessOperation</Setting>
  </Item>
  <Item Name="EnsLib.PEX.BusinessProcess" Category="" ClassName="EnsLib.PEX.BusinessProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">demo.CustomProcess</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths"></Setting>
    <Setting Target="Host" Name="%gatewayPort">44444</Setting>
    <Setting Target="Host" Name="%gatewayHost">0.0.0.0</Setting>
  </Item>
  <Item Name="EnsLib.PEX.BusinessOperation" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">demo.CustomOperation</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths"></Setting>
    <Setting Target="Host" Name="%remoteSettings">outPath=/datavol/data/out/</Setting>
  </Item>
</Production>
}

}
