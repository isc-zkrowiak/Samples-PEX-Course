Class Demo.PEX.Production.DotNet.RemoteOutboundAdapter Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.PEX.Production.RemoteOutboundAdapter" LogGeneralTraceEvents="false">
<Description></Description>
<ActorPoolSize>2</ActorPoolSize>
<Item Name="Demo.PEX.TickerService" Category="" ClassName="Demo.PEX.TickerService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Host" Name="TargetConfigName">Demo.PEX.BusinessOperation</Setting>
<Setting Target="Host" Name="RemoteMessagePackageName">InterSystems.Demo.PEX</Setting>
</Item>
<Item Name="Demo.PEX.BusinessOperation" Category="" ClassName="Demo.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="true" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Adapter" Name="%gatewayPort">55555</Setting>
<Setting Target="Adapter" Name="%gatewayExtraClasspaths">C:\PEXDemo\DemoPEX.exe</Setting>
<Setting Target="Adapter" Name="%remoteClassname">InterSystems.Demo.PEX.OutboundAdapter</Setting>
</Item>
</Production>
}

}
