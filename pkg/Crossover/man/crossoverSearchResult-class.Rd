\docType{class}
\name{crossoverSearchResult-class}
\alias{crossoverSearchResult}
\alias{crossoverSearchResult-class}
\alias{print,crossoverSearchResult-method}
\alias{show,crossoverSearchResult-method}
\title{Class crossoverSearchResult}
\description{
  A S4 class for the search result for crossover designs:
  crossoverSearchResult
}
\section{Slots}{
  \describe{ \item{list("design")}{An object of class
  \code{crossoverDesign} describing the best design that
  was found.}\item{:}{An object of class
  \code{crossoverDesign} describing the best design that
  was found.} \item{list("startDesigns")}{A list of start
  designs to search from.}\item{:}{A list of start designs
  to search from.} \item{list("model")}{A numeric
  specifying the model the design was searched for or -1 if
  unknown.}\item{:}{A numeric specifying the model the
  design was searched for or -1 if unknown.}
  \item{list("eff")}{List, Progress of the algorithm. TODO:
  Explain further.}\item{:}{List, Progress of the
  algorithm. TODO: Explain further.}
  \item{list("search")}{List, TODO}\item{:}{List, TODO}
  \item{list("time")}{Named numeric with the time in
  seconds the algorithm was searching.}\item{:}{Named
  numeric with the time in seconds the algorithm was
  searching.} \item{list("misc")}{List - in the moment not
  used.}\item{:}{List - in the moment not used.} }
}
\examples{
x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
print(x)
}
\author{
  Kornelius Rohmeyer \email{rohmeyer@small-projects.de}
}

