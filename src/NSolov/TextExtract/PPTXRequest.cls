Class NSolov.TextExtract.PPTXRequest Extends Ens.Request
{

Property Filename As %String(MAXLEN = "");

/// use 0 for the first slide
/// -1 for all slides
Property Slide As %Integer [ InitialExpression = -1 ];

Storage Default
{
<Data name="PPTXRequestDefaultData">
<Subscript>"PPTXRequest"</Subscript>
<Value name="1">
<Value>Filename</Value>
</Value>
<Value name="2">
<Value>Slide</Value>
</Value>
</Data>
<DefaultData>PPTXRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
