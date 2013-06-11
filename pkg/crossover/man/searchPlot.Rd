\name{searchPlot}
\alias{searchPlot}

\title{
	Plots information about the search algorithm and its process.
}
\description{
	Plots information about the search algorithm and its process.
}
\usage{
	searchPlot(x, type=1, show.jumps = FALSE)
}
\arguments{
  \item{x}{ Result from searchCrossOverDesign. }
  \item{type}{ Type of plot. Number 1 is more colorful, but number 2 perhaps a bit easier to understand. }
  \item{show.jumps}{ If \code{TRUE} vertical lines will show where the specified jumps occured. }
}
\details{
  The x-axis corresponds to the consecutive simulation runs and the y-axis to the design criterion \var{E} that depending on the model is either a weighted average of efficiency factors or standardized pairwise variances and described in detail in the vignette of this package.
	Also see the vignette for a few examples and a discussion what can be derived from this plots.
}
\value{
	Returns a ggplot object of the plot.
}
\author{
	Kornelius Rohmeyer \email{rohmeyer@small-projects.de}
}
\keyword{ misc }
\keyword{ graphs }


\examples{

x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
searchPlot(x)

x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, n=c(500,10), jumps=c(10, 100))
searchPlot(x, show.jumps=TRUE)
searchPlot(x, type=2)

}

