## text-extractor
Extracts text from PDF files using embeded python


## Installation ZPM

```
USER>zpm "install text-extractor"
```


## How to work with it

### PDF

To get text from the whole document:
```
USER>set pdf = ##class(NSolov.TextExtract.PDF).%New("/full/path/to/file.pdf")
USER>set string = pdf.Extract()
```

To get the number of pages:
```
USER>set pdf = ##class(NSolov.TextExtract.PDF).%New("/full/path/to/file.pdf")
USER>set numpages = pdf.GetNumPages()
```

The first argument of the `Extract` method is the page number (starting from 0).
To get text from the first page of the document:
```
USER>set pdf = ##class(NSolov.TextExtract.PDF).%New("/full/path/to/file.pdf")
USER>set string = pdf.Extract(0)
```

### PPTX

To get text from the whole presentation:
```
USER>set pptx = ##class(NSolov.TextExtract.PPTX).%New("/full/path/to/file.pptx")
USER>set string = pptx.Extract()
```

To get the number of slides:
```
USER>set pptx = ##class(NSolov.TextExtract.PPTX).%New("/full/path/to/file.pptx")
USER>set numslides = pptx.GetNumSlides()
```

The first argument of the `Extract` method is the slide number (starting from 0).
To get text from the first slide of the presentation:
```
USER>set pptx = ##class(NSolov.TextExtract.PDF).%New("/full/path/to/file.pptx")
USER>set string = pptx.Extract(0)
```

### Interoperability

From Interoperability you can use Business Operation `NSolov.TextExtract.BusinessOperation` with request `NSolov.TextExtract.PDFRequest` for pdf and `NSolov.TextExtract.PPTXRequest` for pptx.
The response is `Ens.StringContainer` object.
