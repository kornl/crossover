\name{getModelNr}
\alias{getModelNr}
\title{Get the number or character string specifying the model}
\usage{
  getModelNr(model, type = "numeric")
}
\arguments{
  \item{model}{Number or character string specifying the
  model}

  \item{type}{Eiher \code{"numeric"} or \code{"character"}.
  If numeric the number of the model will be returned.
  Otherwise the character string description of the model.}
}
\value{
  Either number or character string specifying the model.
}
\description{
  Get the number or character string specifying the model
}
\examples{
crossover:::getModelNr("Self-adjacency model")==crossover:::getModelNr(2)
"Self-adjacency model"==crossover:::getModelNr(2, type="character")
crossover:::getModelNr("Self-adjacency model")==2
}

