Class NSolov.TextExtract.PPTX Extends NSolov.TextExtract.AbstractExtractor
{

Method GetNumSlides() As %Integer [ Language = python ]
{
    from pptx import Presentation

    prs = Presentation(self.Filename)

    return sum(1 for _ in prs.slides)
}

/// Extract text from a slide
/// Use -1 to extract text from all slides
Method Extract(slidenum As %Integer = -1) As %String [ Language = python ]
{
    from pptx import Presentation

    prs = Presentation(self.Filename)

    text = ""
    if ( slidenum == -1 ):
        for slide in prs.slides:
            for shape in slide.shapes:
                if hasattr(shape, "text"):
                    text = text + " " + shape.text
    else:
        for shape in prs.slides[slidenum].shapes:
            if hasattr(shape, "text"):
                text = text + " " + shape.text

    return text.strip()
}

}
