Class Demo.PEX.Production.DotNet.RemoteBusinessOperation Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.PEX.Production.RemoteBusinessOperation" LogGeneralTraceEvents="false">
<Description></Description>
<ActorPoolSize>2</ActorPoolSize>
<Item Name="Demo.PEX.TickerService" Category="" ClassName="Demo.PEX.TickerService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Host" Name="TargetConfigName">InterSystems.Demo.PEX.BusinessOperation</Setting>
<Setting Target="Host" Name="RemoteMessagePackageName">InterSystems.Demo.PEX</Setting>
</Item>
<Item Name="InterSystems.Demo.PEX.BusinessOperation" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="true" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Host" Name="%gatewayPort">55555</Setting>
<Setting Target="Host" Name="%gatewayExtraClasspaths">C:\PEXDemo\DemoPEX.exe</Setting>
<Setting Target="Host" Name="%remoteClassname">InterSystems.Demo.PEX.BusinessOperation</Setting>
</Item>
</Production>
}

}
