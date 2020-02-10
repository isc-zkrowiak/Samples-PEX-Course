Class Demo.PEX.Production.DotNet.RemoteServiceAdapter Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.PEX.Production.RemoteServiceAdapter" LogGeneralTraceEvents="false">
<Description></Description>
<ActorPoolSize>2</ActorPoolSize>
<Item Name="Demo.PEX.ServiceAdapter" Category="" ClassName="Demo.PEX.ServiceAdapter" PoolSize="1" Enabled="true" Foreground="true" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Adapter" Name="%gatewayPort">55555</Setting>
<Setting Target="Adapter" Name="%gatewayExtraClasspaths">C:\PEXDemo\DemoPEX.exe</Setting>
<Setting Target="Adapter" Name="%remoteClassname">InterSystems.Demo.PEX.InboundAdapter</Setting>
<Setting Target="Host" Name="%gatewayPort">55555</Setting>
<Setting Target="Host" Name="%gatewayExtraClasspaths">C:\PEXDemo\DemoPEX.exe</Setting>
<Setting Target="Host" Name="%remoteClassname">InterSystems.Demo.PEX.BusinessService</Setting>
</Item>
</Production>
}

}
