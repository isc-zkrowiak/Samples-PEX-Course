Class Demo.PEX.Production.DotNet.RemoteInboundAdapter Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.PEX.Production.RemoteInboundAdapter" LogGeneralTraceEvents="false">
<Description></Description>
<ActorPoolSize>2</ActorPoolSize>
<Item Name="Demo.PEX.BusinessService" Category="" ClassName="Demo.PEX.BusinessService" PoolSize="1" Enabled="true" Foreground="true" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Adapter" Name="CallInterval">5</Setting>
<Setting Target="Adapter" Name="%gatewayPort">55555</Setting>
<Setting Target="Adapter" Name="%gatewayExtraClasspaths">C:\PEXDemo\DemoPEX.exe</Setting>
<Setting Target="Adapter" Name="%remoteClassname">InterSystems.Demo.PEX.InboundAdapter</Setting>
<Setting Target="Adapter" Name="%remoteSettings">min=11
max=99</Setting>
</Item>
</Production>
}

}
