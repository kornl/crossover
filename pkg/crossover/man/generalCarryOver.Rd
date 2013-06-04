\name{general.carryover}
\alias{general.carryover}

\title{
	Search for a Cross-Over Design
}
\description{
	Search for a Cross-Over Design
}
\usage{
	general.carryover(design, model, t0=1, rho=0.5, sim=0, parm.val=0)
}
\arguments{
  \item{design}{ Cross-over design. }
  \item{model}{ Model - one of the following: "Standard additive model" (2),
            "Second-order carry-over effects" (3),
            "Full set of interactions" (3),
            "Self-adjacency model" (3),
            "Placebo model" (2),
            "No carry-over into self model" (2),
            "Treatment decay model" (2),
            "Proportionality model" (1) ... }
  \item{t0}{ ... }
  \item{rho}{ The proportionality parameter for the proportionality model.}
  \item{parm.val}{ ... }  
}
\details{
	See the vignette of this package for further details.
}
\value{
	TODO ...
}
\author{
	Byron Jones
}
\references{
Jones, B., & Kenward, M. G. (2003). Design and analysis of cross-over trials (Vol. 98). Chapman & Hall.
}
\keyword{ misc }

\examples{
x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, eff.factor=1)
}