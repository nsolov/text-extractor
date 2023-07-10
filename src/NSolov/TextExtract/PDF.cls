Class NSolov.TextExtract.PDF Extends NSolov.TextExtract.AbstractExtractor
{

Property TmpDir As %String(MAXLEN = 1000);

Method GetNumPages() As %Integer [ Language = python ]
{
    from pypdf import PdfReader

    pdf_reader = PdfReader(self.Filename)

    return len(pdf_reader.pages)
}

/// returns the number of saved images
Method SavePagesAsImages() As %Integer [ Language = python, Private ]
{

    from pdf2image import convert_from_path

    images = convert_from_path(self.Filename)
    for i in range(len(images)):
        images[i].save(self.TmpDir+'page'+ str(i).zfill(5) +'.ppm', 'PPM')

    return len(images)
}

Method SaveImagesFromPage(pagenumber As %Integer) As %Integer [ Language = python ]
{
    from pypdf import PdfReader
    import os
    import shutil

    pdf_reader = PdfReader(self.Filename)

    count = 0

    try:
        if (pagenumber == -1):
            # all pages
            for page in pdf_reader.pages:
                print(page.images)
                for image_file_object in page.images:
                    with open(self.TmpDir+str(count) + image_file_object.name, "wb") as fp:
                        fp.write(image_file_object.data)
                        count += 1
        else:
            page = pdf_reader.pages[pagenumber]

            for image_file_object in page.images:
                with open(self.TmpDir+str(count) + image_file_object.name, "wb") as fp:
                    fp.write(image_file_object.data)
                    count += 1
    except:
        shutil.rmtree(self.TmpDir)
        os.makedirs(self.TmpDir)
    return count
}

Method getTextFromOnePageWithImages(pagenum As %Integer = -1, lang = "eng") As %String
{
    Set ..TmpDir = ##class(%File).NormalizeDirectory($$$FileTempDir)
    Set text = ..Extract(pagenum)
    Set imgNum = ..SaveImagesFromPage(pagenum)
    Set statement = ##class(%SQL.Statement).%New()
    Do statement.%PrepareClassQuery("%File", "FileSet")
    Set rs = statement.%Execute(..TmpDir)
    While rs.%Next(.sc) {
        If $$$ISERR(sc) Quit
        Set file = rs.%Get("Name")
        Set imgExtractor = ##class(NSolov.TextExtract.Image).%New(file, lang)
        Set text = text_$$$NL_imgExtractor.Extract()
    }
    Do ##class(%File).RemoveDirectoryTree(..TmpDir)
    Set ..TmpDir = ""
    Return text
}

/// Extract text and text from each image
Method ExtractWithImages(pageNum As %Integer = -1, lang As %String = "eng") As %String
{
    Set text = ""
    If (pageNum = -1) {
        // all pages
        Set pnum = ..GetNumPages()
        For i=0:1:pnum-1 {
            Set text = text _ ..getTextFromOnePageWithImages(i, lang)
        }
    } Else {
        // one page
        Set text = ..getTextFromOnePageWithImages(pageNum, lang)
    }
    Return text
}

/// Save .pdf pages as images, than extract text from images
Method ExtractAsImages(pageNum As %Integer = -1, lang As %String = "eng") As %String
{
    Set ..TmpDir = ##class(%File).NormalizeDirectory($$$FileTempDir)
    Set imgNum = ..SavePagesAsImages()
    Set text = ""
    Set statement = ##class(%SQL.Statement).%New()
    Do statement.%PrepareClassQuery("%File", "FileSet")
    Set rs = statement.%Execute(..TmpDir)
    Set i = 0
    While rs.%Next(.sc) {
        If $$$ISERR(sc) Quit
        Set file = rs.%Get("Name")
        If (pageNum = -1){
            Set imgExtractor = ##class(NSolov.TextExtract.Image).%New(file, lang)
            Set text = text_$$$NL_imgExtractor.Extract()
        } Else {
            If i=pageNum {
                Set imgExtractor = ##class(NSolov.TextExtract.Image).%New(file, lang)
                Set text = imgExtractor.Extract()
                Quit
            }
        }
        Set i = i + 1
    }
    Do ##class(%File).RemoveDirectoryTree(..TmpDir)
    Set ..TmpDir = ""
    Return text
}

/// Extracts text only from a page
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
