\name{searchCrossOverDesign}
\alias{searchCrossOverDesign}

\title{
	Search for a Cross-Over Design
}
\description{
	Search for a Cross-Over Design
}
\usage{
	searchCrossOverDesign(s, p, v, model="Standard additive model", eff.factor=1, 
    v.rep, balance.s=FALSE, balance.p=FALSE, verbose=FALSE, model.param=list(), 
    n=c(5000, 20), jumps=c(5, 50), start.designs, contrast)
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
  \item{eff.factor}{ Weights for different efficiency factors. (Not used in the moment.) }
  \item{v.rep}{ Integer vector specifying how often each treatment should be assigned (sum must equal s*p).}
  \item{balance.s}{ Boolean specifying whether to allocate the treatments as equally as possible to each sequence (can result in loss of efficiency). }  
  \item{balance.p}{ Boolean specifying whether to allocate the treatments as equally as possible to each period (can result in loss of efficiency). }  
  \item{verbose}{ Boolean specifying whether verbose output should be printed. }  
  \item{model.param}{ List of additional model specific parameters. In the moment these are \code{ppp}, the proportionality parameter for the proportionality model, and \code{placebos}, the number of placebo treatments in the placebo model. }  
  \item{n}{ \code{n=c(n1,n2)} with \var{n1} the number of hill climbing steps per trial and \var{n2} the number of searches from random start matrices. }
  \item{jumps}{ To reduze the possibility of the hill-climbing algorithm to get stuck in local extrema long jumps of distance \var{d} can be performed all \var{n} steps. This can be specified as \code{long.jumps=c(d,n)}. If \var{long.jumps} has only length 1 the default for \var{n} is 50.}
  \item{start.designs}{ List of start designs. If missing or to few start designs are specified (with regard to parameter \var{n} which specifies a number of 20 start designs as default) the start designs are generated randomly with the sample function.}
  \item{contrast}{ Contrast matrix to be optimised. TODO: Example and better explanation for contrast. }
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

\examples{
x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)

result <- searchCrossOverDesign(s=9, p=5, v=4, model=4, eff.factor=1, jumps=c(10000,200), n=c(1000,5))
searchPlot(result)

}