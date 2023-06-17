Class NSolov.TextExtract.PDFBusinessOperation Extends Ens.BusinessOperation
{

Method ExtractText(pRequest As NSolov.TextExtract.PDFRequest, Output pResponse As Ens.StringContainer) As %Status
{
    Try {
        set pdfextractor = ##class(NSolov.TextExtract.PDF).%New(pRequest.Filename)
        set pResponse = ##class(Ens.StringContainer).%New(pdfextractor.Extract(pRequest.Page))
        return $$$OK
    } Catch ex {
        return ex.AsStatus()
    }
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="NSolov.TextExtract.PDFRequest">
    <Method>ExtractText</Method>
  </MapItem>
</MapItems>
}

}
