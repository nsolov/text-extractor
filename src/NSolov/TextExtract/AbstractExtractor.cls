Class NSolov.TextExtract.AbstractExtractor Extends %RegisteredObject
{

Property Filename As %String;

Method %OnNew(filename As %String) As %Status
{
    if ('##class(%File).Exists(filename, .t)) {
        $$$ThrowStatus($$$ERROR(1101,filename))
    }
    set ..Filename = filename
    return $$$OK
}

Method Extract() As %String [ Abstract, Language = python ]
{
}

}
