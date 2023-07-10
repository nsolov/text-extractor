Class NSolov.TextExtract.Image Extends NSolov.TextExtract.AbstractExtractor
{

Property Language As %String;

Method %OnNew(filename As %String, language As %String = "eng") As %Status
{
    do ##super(filename)
    set ..Language = language
    return $$$OK
}

/// Extract text from image
Method Extract() As %String [ Language = python ]
{
    from pytesseract import pytesseract

    str = pytesseract.image_to_string(self.Filename, lang=self.Language)
    return str
}

}
