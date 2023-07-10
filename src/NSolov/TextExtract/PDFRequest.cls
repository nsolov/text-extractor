Class NSolov.TextExtract.PDFRequest Extends Ens.Request
{

/// How to work with images in .pdf
/// Empty value - extract only text
/// fromImages - save all images from documents and concatenate text with text from images; you must install 'tesseract-ocr' to use this option
/// pagesAsImages - save each page of .pdf as image and then use; you must install 'tesseract-ocr' and 'poppler-utils'
Property UseOCR(VALUELIST = ",fromImages,pagesAsImages");

Property LanguageOCR [ InitialExpression = "eng" ];

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
<Value name="3">
<Value>UseOCR</Value>
</Value>
<Value name="4">
<Value>LanguageOCR</Value>
</Value>
</Data>
<DefaultData>PDFRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
