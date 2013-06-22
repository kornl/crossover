\name{crossoverDesign-class}
\docType{class}
\alias{crossoverDesign-class}
\alias{crossoverDesign}
\alias{show,crossoverDesign-method}
\alias{print,crossoverDesign-method}
%\alias{plot,crossoverDesign-method}
\title{Class crossoverDesign}
\description{A S4 class for crossover designs: crossoverDesign}
\section{Slots}{
  \describe{    
    \item{\code{design}:}{ Matrix }
    \item{\code{s}:}{ Number of sequences. }
    \item{\code{p}:}{ Number of periods. }
    \item{\code{v}:}{ Number of treatments. }
    \item{\code{model}:}{ A numeric specifying the model the design was searched for or -1 if unknown. }
    \item{\code{description}:}{ Optional description of design or reference. }
    \item{\code{attr}:}{ List with attributes. }
    \item{\code{misc}:}{ List with miscellaneous stuff - not used yet. }
  }
}
\section{Methods}{
  \describe{
    %\item{show}{\code{signature(object = "graphMCP")}: A method for getting the adjacency matrix of the graph.}
    \item{print}{\code{signature(object = "crossoverDesign")}: Prints the crossover design (and ... TODO).}
    %\item{plot}{\code{signature(object = "graphMCP")}: A method for setting the weights.
    %  If a third optional argument \code{node} is specified, only for these nodes the weight will be set.}
  }
}
\author{Kornelius Rohmeyer \email{rohmeyer@small-projects.de}}
\examples{

design <- t(rbind(c(1,1,2,2),
                  c(2,2,1,1),
                  c(1,1,2,2),
                  c(2,2,1,1),
                  c(1,2,2,1),
                  c(2,1,1,2)))
                   
new("crossoverDesign", design)

}
\keyword{ graphs }