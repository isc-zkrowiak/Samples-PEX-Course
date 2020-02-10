Class Demo.PEX.Production.DotNet.RemoteBusinessProcess Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.PEX.Production.RemoteBusinessProcess" LogGeneralTraceEvents="false">
<Description></Description>
<ActorPoolSize>2</ActorPoolSize>
<Item Name="Demo.PEX.TickerService" Category="" ClassName="Demo.PEX.TickerService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Host" Name="TargetConfigName">InterSystems.Demo.PEX.BusinessProcess</Setting>
<Setting Target="Host" Name="RemoteMessagePackageName">InterSystems.Demo.PEX</Setting>
<Setting Target="Adapter" Name="CallInterval">30</Setting>
</Item>
<Item Name="InterSystems.Demo.PEX.BusinessProcess" Category="" ClassName="EnsLib.PEX.BusinessProcess" PoolSize="1" Enabled="true" Foreground="true" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Host" Name="%gatewayPort">55555</Setting>
<Setting Target="Host" Name="%gatewayExtraClasspaths">C:\PEXDemo\DemoPEX.exe</Setting>
<Setting Target="Host" Name="%remoteClassname">InterSystems.Demo.PEX.BusinessProcess</Setting>
</Item>
<Item Name="Demo.PEX.RandomGenerator" Category="" ClassName="Demo.PEX.RandomGenerator" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Host" Name="RemoteMessagePackageName">InterSystems.Demo.PEX</Setting>
</Item>
</Production>
}

}
