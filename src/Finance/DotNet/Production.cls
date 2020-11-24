Class Finance.DotNet.Production Extends Ens.Production
{

ClassMethod OnStart() As %Status
{
  set GatewayName = ##class(Setup.GatewayMaker).#DOTNETNAME
  set st =  ##class(%Net.Remote.Service).StartGateway(GatewayName,1)
  return st
}

ClassMethod OnStop() As %Status
{
  set GatewayName = ##class(Setup.GatewayMaker).#DOTNETNAME
  set st = ##class(%Net.Remote.Service).StopGateway(GatewayName,1)
  return st
}

XData ProductionDefinition
{
<Production Name="Finance.DotNet.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="ToPayFromOperation" Category="" ClassName="Finance.OutboundPEX" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ToPayFromBank</Setting>
    <Setting Target="Host" Name="%remoteSettings">FilePath=/irisdev/app/data/FromBankOut/</Setting>
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">/irisdev/app/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
  </Item>
  <Item Name="ToPayToOperation" Category="" ClassName="Finance.OutboundPEX" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ToPayToBank</Setting>
    <Setting Target="Host" Name="%remoteSettings">FilePath=/irisdev/app/data/ToBankOut/</Setting>
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">/irisdev/app/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
  </Item>
  <Item Name="ProcessPaymentRequest" Category="" ClassName="EnsLib.PEX.BusinessProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.ProcessPaymentRequest</Setting>
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">/irisdev/app/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
  </Item>
  <Item Name="FromFileService" Category="" ClassName="Finance.InboundPEX" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">Finance.FromFileTransaction</Setting>
    <Setting Target="Host" Name="%remoteSettings">TargetComponentNames=ProcessPaymentRequest</Setting>
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">/irisdev/app/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
    <Setting Target="Adapter" Name="%gatewayExtraClasspaths">/irisdev/app/DotNet/bin/Debug/netcoreapp2.1/DotNet.dll</Setting>
    <Setting Target="Adapter" Name="%gatewayPort">55555</Setting>
    <Setting Target="Adapter" Name="%remoteClassname">Finance.PEXInboundAdapter</Setting>
    <Setting Target="Adapter" Name="%remoteSettings">InboundFilePath=/irisdev/app/data/in/</Setting>
  </Item>
</Production>
}

}
