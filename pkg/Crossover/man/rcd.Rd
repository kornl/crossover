\name{rcd}
\alias{rcd}
\title{Create a row column design}
\usage{
  rcd(X, v, model)
}
\arguments{
  \item{X}{cross-over design}

  \item{v}{number of treatments}

  \item{model}{String or number describing the model. See
  \code{\link{getModelNr}}.}
}
\value{
  A row-column design (as matrix - but not the design
  matrix).
}
\description{
  Create a row column design
}
\examples{
# TODO
}
\seealso{
  \code{\link{rcdMatrix}} gives the row-column design
  matrix.
}

