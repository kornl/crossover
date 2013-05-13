\name{searchCrossOverDesign}
\alias{searchCrossOverDesign}

\title{
	Search for a Cross-Over Design
}
\description{
	Search for a Cross-Over Design
}
\usage{
	searchCrossOverDesign(s, p, v, model="Standard additive model", eff.factor, 
    v.rep, balance.s=FALSE, balance.p=FALSE, verbose=FALSE, ppp = 0.5, placebos = 1)
}
\arguments{
  \item{s}{ Number of sequences. }
  \item{p}{ Number of periods. }
  \item{v}{ Number of treatments. }
  \item{model}{ Model - one of the following: "Standard additive model" (2),
            "Second-order carry-over effects" (3),
            "Full set of interactions" (3),
            "Self-adjacency model" (3),
            "Placebo model" (2),
            "No carry-over into self model" (2),
            "Treatment decay model" (2),
            "Proportionality model" (1). The number in parentheses is the number of different efficiency factors that can be specified.}
  \item{eff.factor}{ Weights for different efficiency factors. }
  \item{v.rep}{ Integer vector specifying how often each treatment should be assigned (sum must equal s*p).}
  \item{balance.s}{ Boolean specifying whether to allocate the treatments as equally as possible to each sequence (can result in loss of efficiency). }  
  \item{balance.p}{ Boolean specifying whether to allocate the treatments as equally as possible to each period (can result in loss of efficiency). }  
  \item{verbose}{ Boolean specifying whether verbose output should be printed. }  
  \item{ppp}{ Proportionality parameter for the proportionality model. }  
  \item{placebos}{ Number of placebo treatments in the placebo model. }  
}
\details{
	See the vignette of this package for further details.
}
\value{
	Returns the design as an integer matrix.
}
\author{
	Kornelius Rohmeyer \email{rohmeyer@small-projects.de}
}
\references{
John, J. A., Russell, K. G., & Whitaker, D. (2004). CrossOver: an algorithm for the construction of efficient cross-over designs. Statistics in medicine, 23(17), 2645-2658.
}
\keyword{ misc }
\keyword{ graphs }

\examples{
x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, eff.factor=1)
}