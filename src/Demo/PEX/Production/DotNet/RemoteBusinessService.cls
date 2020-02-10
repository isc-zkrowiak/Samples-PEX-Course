Class Demo.PEX.Production.DotNet.RemoteBusinessService Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.PEX.Production.DotNet.RemoteBusinessService" LogGeneralTraceEvents="false">
<Description></Description>
<ActorPoolSize>2</ActorPoolSize>
<Item Name="InterSystems.Demo.PEX.BusinessService" Category="" ClassName="EnsLib.PEX.BusinessService" PoolSize="1" Enabled="true" Foreground="true" Comment="" LogTraceEvents="false" Schedule="">
<Setting Target="Host" Name="%gatewayPort">55555</Setting>
<Setting Target="Host" Name="%gatewayExtraClasspaths">C:\PEXDemo\DemoPEX.exe</Setting>
<Setting Target="Host" Name="%remoteClassname">InterSystems.Demo.PEX.BusinessService</Setting>
<Setting Target="Host" Name="%remoteSettings">Min=111
Mid=333
Max=555</Setting>
</Item>
</Production>
}

}
