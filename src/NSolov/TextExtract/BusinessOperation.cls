Class NSolov.TextExtract.BusinessOperation Extends Ens.BusinessOperation
{

Method ExtractTextFromPDF(pRequest As NSolov.TextExtract.PDFRequest, Output pResponse As Ens.StringContainer) As %Status
{
    Try {
        Set text = ""
        Set extractor = ##class(NSolov.TextExtract.PDF).%New( ##class(%File).NormalizeFilenameWithSpaces(pRequest.Filename) )
        If (pRequest.UseOCR = "pagesAsImages") {
            Set text = extractor.ExtractAsImages(pRequest.Page, pRequest.LanguageOCR)
        } ElseIf (pRequest.UseOCR = "fromImages") {
            Set text = extractor.ExtractWithImages(pRequest.Page, pRequest.LanguageOCR)
        } Else {
            Set text = extractor.Extract(pRequest.Page)
        }
        Set pResponse = ##class(Ens.StringContainer).%New(text)
        Return $$$OK
    } Catch ex {
        Return ex.AsStatus()
    }
}

Method ExtractTextFromPPTX(pRequest As NSolov.TextExtract.PPTXRequest, Output pResponse As Ens.StringContainer) As %Status
{
    Try {
        Set extractor = ##class(NSolov.TextExtract.PPTX).%New(pRequest.Filename)
        Set pResponse = ##class(Ens.StringContainer).%New(extractor.Extract(pRequest.Slide))
        Return $$$OK
    } Catch ex {
        Return ex.AsStatus()
    }
}

Method ExtractTextFromImage(pRequest As NSolov.TextExtract.ImageRequest, Output pResponse As Ens.StringContainer) As %Status
{
    Try {
        Set extractor = ##class(NSolov.TextExtract.Image).%New(pRequest.Filename, pRequest.Language)
        Set pResponse = ##class(Ens.StringContainer).%New(extractor.Extract())
    } Catch ex {
        Return ex.AsStatus()
    }
    Return $$$OK
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="NSolov.TextExtract.PDFRequest">
    <Method>ExtractTextFromPDF</Method>
  </MapItem>
  <MapItem MessageType="NSolov.TextExtract.PPTXRequest">
    <Method>ExtractTextFromPPTX</Method>
  </MapItem>
  <MapItem MessageType="NSolov.TextExtract.ImageRequest">
    <Method>ExtractTextFromImage</Method>
  </MapItem>
</MapItems>
}

}
