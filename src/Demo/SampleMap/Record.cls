/// RECORDMAP: Generated from RecordMap 'Demo.SampleMap'
/// on 2020-01-22 at 21:04:35.227 [2020-01-22 21:04:35.227 UTC]
/// by user SuperUser
Class Demo.SampleMap.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base, EnsLib.PEX.Message) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Name As %String;

Property Phone As %String;

Property Company As %String;

Property City As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="%jsonObject">
<Attribute>%jsonObject</Attribute>
<Structure>node</Structure>
<Subscript>"%jsonObject"</Subscript>
</Data>
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Company</Value>
</Value>
<Value name="5">
<Value>City</Value>
</Value>
<Value name="6">
<Value>Phone</Value>
</Value>
<Value name="7">
<Value>%classname</Value>
</Value>
</Data>
<DataLocation>^Demo.SampleMap.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Demo.SampleMap.RecordD</IdLocation>
<IndexLocation>^Demo.SampleMap.RecordI</IndexLocation>
<StreamLocation>^Demo.SampleMap.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
