## text-extractor
Extracts text from PDF files using embeded python


## Installation ZPM

```
USER>zpm "install text-extractor"
```


## How to work with it

To get text from the whole document:
```
USER>set pdf = ##class(NSolov.TextExtract.PDF).%New("/full/path/to/file.pdf")
USER>set string = pdf.Extract()
```

The first argument of this method is the page number (starting from 0).
To get text from the first page of the document:
```
USER>set pdf = ##class(NSolov.TextExtract.PDF).%New("/full/path/to/file.pdf")
USER>set string = pdf.Extract(0)
```

From Interoperability you can use Business Operation `NSolov.TextExtract.PDFBusinessOperation` with request `NSolov.TextExtract.PDFRequest`.
The response is `Ens.StringContainer` object.
