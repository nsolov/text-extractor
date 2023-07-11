## text-extractor
Extracts text from PDF, PPTX files and Images (PNG, JPEG, ...) using embeded python


## Installation ZPM

1. text-extractor
```
USER>zpm "install text-extractor"
```

2. Images (optional)
This package uses tesseract-ocr to extract text from images. If you will be using to extract text from images, you will need to install tesseract-ocr additionally: apt-get install -yq tesseract-ocr:
`apt-get install tesseract-ocr`

If the text is in any of the languages other than English, you will need the appropriate packages, for example, tesseract-ocr-fra for French: `apt-get install tesseract-ocr-fra`

3. PDF to Image (optional)
This package supports several ways to work with PDF. One of them involves converting pdf to images first, and then using text extraction from images. If you will use this approach you need to install poppler-utils:
`apt-get install poppler-utils`

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

The examples above ignore images that can be inside .pdf and also contain text data

To get text and add text from images to it - use:
```
USER>set pdf = ##class(NSolov.TextExtract.PDF).%New("/full/path/to/file.pdf")
USER>set string = pdf.ExtractWithImages(0,"eng")
```

Another option is to save each .pdf page as an image, and then extract the text from those images
```
USER>set pdf = ##class(NSolov.TextExtract.PDF).%New("/full/path/to/file.pdf")
USER>set string = pdf.ExtractAsImages(0,"eng")
```
(use `-1` as first argument to process whole document) 

### IMAGES

To get text from the image:
```
USER>set img = ##class(NSolov.TextExtract.Image).%New("/full/path/to/file.png", "fra")
USER>set string = img.Extract()
```
(second argument in %New() is language (`eng` by default))

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

From Interoperability you can use Business Operation `NSolov.TextExtract.BusinessOperation` with request `NSolov.TextExtract.PDFRequest` for pdf, `NSolov.TextExtract.PPTXRequest` for pptx and `NSolov.TextExtract.ImageRequest` for images.
The response is `Ens.StringContainer` object.
