Class Demo.PEX.NonPollingBusinessService Extends Ens.BusinessService
{

Method OnProcessInput(pRequest As %RegisteredObject, Output pResponse As %RegisteredObject, ByRef pHint As %String) As %Status
{
	set tSC = $$$OK
	try {
		set pResponse = "[IRIS] Demo.PEX.NonPollingBusinessService:OnProcessInput() receives """_pRequest_""""
	} catch ex {
		set tSC = ex.AsStatus()
	}
	quit tSC
}

}
