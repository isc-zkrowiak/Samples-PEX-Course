Class Demo.PEX.Production.Java.RemoteInboundAdapter Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.PEX.Production.Java.RemoteInboundAdapter" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Demo.PEX.BusinessService" Category="" ClassName="Demo.PEX.BusinessService" PoolSize="1" Enabled="false" Foreground="true" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="%gatewayPort">44444</Setting>
    <Setting Target="Adapter" Name="%gatewayExtraClasspaths">c:\PEXDemo\intersystems-PEX-demo-1.0.0.jar</Setting>
    <Setting Target="Adapter" Name="%remoteClassname">com.intersystems.demo.pex.InboundAdapter</Setting>
    <Setting Target="Adapter" Name="%remoteSettings">min=11
max=99</Setting>
  </Item>
  <Item Name="AdapterService" Category="" ClassName="Demo.PEX.BusinessService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EnsLib.PEX.BusinessService" Category="" ClassName="EnsLib.PEX.BusinessService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%gatewayExtraClasspaths">c:\PEXDemo\intersystems-PEX-demo-1.0.0.jar</Setting>
    <Setting Target="Host" Name="%remoteClassname">demo.InboundService</Setting>
    <Setting Target="Adapter" Name="CallInterval">1</Setting>
  </Item>
</Production>
}

}
