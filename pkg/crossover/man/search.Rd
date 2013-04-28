\name{searchCrossOverDesign}
\alias{searchCrossOverDesign}

\title{
	Search for a Cross-Over Design
}
\description{
	Search for a Cross-Over Design
}
\usage{
	searchCrossOverDesign(s, p, v, model="Standard additive model", eff.factor, v.rep, balance.s=FALSE, balance.p=FALSE, verbose=TRUE)
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

\keyword{ misc }
\keyword{ graphs }

