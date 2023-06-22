Class NSolov.TextExtract.BusinessOperation Extends Ens.BusinessOperation
{

Method ExtractTextFromPDF(pRequest As NSolov.TextExtract.PDFRequest, Output pResponse As Ens.StringContainer) As %Status
{
    Try {
        Set extractor = ##class(NSolov.TextExtract.PDF).%New(pRequest.Filename)
        Set pResponse = ##class(Ens.StringContainer).%New(extractor.Extract(pRequest.Page))
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

XData MessageMap
{
<MapItems>
  <MapItem MessageType="NSolov.TextExtract.PDFRequest">
    <Method>ExtractTextFromPDF</Method>
  </MapItem>
  <MapItem MessageType="NSolov.TextExtract.PPTXRequest">
    <Method>ExtractTextFromPPTX</Method>
  </MapItem>
</MapItems>
}

}
