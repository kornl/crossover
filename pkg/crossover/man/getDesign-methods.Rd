\docType{methods}
\name{getDesign}
\alias{getDesign}
\alias{getDesign,crossoverSearchResult-method}
\title{Extract Design from a crossoverSearchResult}
\arguments{
  \item{object}{A searchCrossOverDesign object from which
  the design should be extracted.}
}
\value{
  Returns a numeric matrix representing the crossover
  design.
}
\description{
  Extract Design from a crossoverSearchResult
}
\examples{
#'
x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
getDesign(x)
}
\author{
  Kornelius Rohmeyer \email{rohmeyer@small-projects.de}
}

