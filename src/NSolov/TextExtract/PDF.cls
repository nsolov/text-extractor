Class NSolov.TextExtract.PDF Extends NSolov.TextExtract.AbstractExtractor
{

Method GetNumPages() As %Integer [ Language = python ]
{
    from pypdf import PdfReader

    pdf_reader = PdfReader(self.Filename)

    return len(pdf_reader.pages)
}

/// Extract text from a page
/// Use -1 to extract text from the whole document
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
