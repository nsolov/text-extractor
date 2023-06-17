Class NSolov.TextExtract.PDFRequest Extends Ens.Request
{

Property Filename As %String(MAXLEN = "");

/// use 0 for the first page
/// -1 for all pages
Property Page As %Integer [ InitialExpression = -1 ];

Storage Default
{
<Data name="PDFRequestDefaultData">
<Subscript>"PDFRequest"</Subscript>
<Value name="1">
<Value>Filename</Value>
</Value>
<Value name="2">
<Value>Page</Value>
</Value>
</Data>
<DefaultData>PDFRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
