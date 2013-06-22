\name{crossoverSearchResult-class}
\docType{class}
\alias{crossoverSearchResult-class}
\alias{crossoverSearchResult}
\alias{show,crossoverSearchResult-method}
\alias{print,crossoverSearchResult-method}
%\alias{plot,crossoverSearchResult-method}
\title{Class crossoverSearchResult}
\description{A S4 class for the search result for crossover designs: crossoverSearchResult}
\section{Slots}{  
  \describe{    
    \item{\code{design}:}{An object of class \code{crossoverDesign} describing the best design that was found.}
    \item{\code{startDesigns}:}{A list of start designs to search from.}
    \item{\code{model}:}{A numeric specifying the model the design was searched for or -1 if unknown.}
    \item{\code{eff}:}{List, Progress of the algorithm. TODO: Explain further.}
    \item{\code{search}:}{List, TODO}
    \item{\code{time}:}{Named numeric with the time in seconds the algorithm was searching.}
    \item{\code{misc}:}{List - in the moment not used.}    
  }
}
\section{Methods}{
  \describe{
    %\item{show}{\code{signature(object = "crossoverSearchResult")}: A method for getting the adjacency matrix of the graph.}
    %\item{print}{\code{signature(object = "crossoverSearchResult")}: A method for getting the weights.
    %  If a third optional argument \code{node} is specified, only for these nodes the weight will be returned.}
    \item{plot}{\code{signature(object = "crossoverSearchResult")}: A method for plotting the result of a search.
      Takes the following arguments:  
      \itemize{
        \item{x}{ Result from searchCrossOverDesign. }    
        \item{type}{ Type of plot. Number 1 is more colorful, but number 2 perhaps a bit easier to understand. }
        \item{show.jumps}{ If \code{TRUE} vertical lines will show where the specified jumps occured. }
      }
    }
  }
}
\author{Kornelius Rohmeyer \email{rohmeyer@small-projects.de}}
\examples{

x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
print(x)

}