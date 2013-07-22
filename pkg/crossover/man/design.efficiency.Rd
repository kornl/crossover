\name{design.efficiency}
\alias{design.efficiency}
\title{Create the design matrix, variance-covariance matrix, the variance of each
pairwise comparison and the efficicency of each pairwise comparison for a
cross-over design}
\usage{
  design.efficiency(design)
}
\arguments{
  \item{design}{Cross-over design.}
}
\value{
  list(xmat.no.subjects=xmat.no.subjects,
  var.trt.pair=var.trt.pair,eff.trt.pair=eff.trt.pair,av.eff.trt.pair=av.eff.trt.pair,
  var.trt.pair.adj=var.trt.pair.adj,eff.trt.pair.adj=eff.trt.pair.adj,av.eff.trt.pair.adj=av.eff.trt.pair.adj)
}
\description{
  Function to read in a cross-over design and create the
  design matrix X, the variance-covariance matrix of the
  parameter estimates (X'X)^-1, the variance of each
  pairwise comparison and the efficicency of each pairwise
  comparison.
}
\details{
  This is done for a model with fixed subject effects,
  period effects and treatments and for the above model
  with first-order carry-over effects added.

  See the vignette of this package for further details.
}
\examples{
x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, eff.factor=1)
design.efficiency(x)
}
\author{
  Byron Jones, 18/11/2011
}
\references{
  Jones, B., & Kenward, M. G. (2003). Design and analysis
  of cross-over trials (Vol. 98). Chapman & Hall.
}
\keyword{misc}

