/// 
Class Finance.Java.BusinessBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.PEX.Message' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<empty name='Test' xpos='200' ypos='250' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
