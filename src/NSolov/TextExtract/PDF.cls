Class NSolov.TextExtract.PDF Extends %RegisteredObject
{

Property Filename As %String;

Method %OnNew(filename As %String) As %Status
{
    set ..Filename = filename
    return $$$OK
}

Method Extract(page As %Integer = -1) As %String [ Language = python ]
{
    from pypdf import PdfReader

    pdf_reader = PdfReader(self.Filename)
    text = ""
    if (page == -1):
        for pg in pdf_reader.pages:
            text += pg.extract_text()
    else:
        text = pdf_reader.pages[page].extract_text()
    return text
}

}
