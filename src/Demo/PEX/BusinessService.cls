Class Demo.PEX.BusinessService Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.PEX.InboundAdapter";

Method OnProcessInput(pRequest As %RegisteredObject, Output pResponse As %RegisteredObject, ByRef pHint As %String) As %Status
{
	set tSC = $$$OK
	try {
		if $$$EnsJobStatus($$$SystemName,$job,$$$eJobForeground) {
			set io = $io use $p
			write !,"[IRIS] Demo.PEX.BusinessService:OnProcessInput() is called"
			use io
		}
		set pResponse = "echo to "_pRequest.value
	} catch ex {
		set tSC = ex.AsStatus()
	}
	quit tSC
}

}
