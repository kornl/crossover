\name{searchPlot}
\alias{searchPlot}

\title{
	Plots information about the search algorithm and its process.
}
\description{
	Search for a Cross-Over Design
}
\usage{
	searchPlot(x, type=1)
}
\arguments{
  \item{x}{ Result from searchCrossOverDesign. }
  \item{type}{ Type of plot. Number 1 is more colorful, but number 2 perhaps a bit easier to understand. }
  }
\details{
	
}
\value{
	Returns the design as an integer matrix.
}
\author{
	Kornelius Rohmeyer \email{rohmeyer@small-projects.de}
}
\keyword{ misc }
\keyword{ graphs }


\examples{

x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, eff.factor=1)
searchPlot(x)
searchPlot(x, type=2)

}

