Class NSolov.TextExtract.ImageRequest Extends Ens.Request
{

Property Filename As %String(MAXLEN = "");

Property Language As %String [ InitialExpression = "eng" ];

Storage Default
{
<Data name="ImageRequestDefaultData">
<Subscript>"ImageRequest"</Subscript>
<Value name="1">
<Value>Filename</Value>
</Value>
<Value name="2">
<Value>Language</Value>
</Value>
</Data>
<DefaultData>ImageRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
