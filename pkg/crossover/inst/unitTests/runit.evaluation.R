evaluation <- function() {
  design1 <- t(rbind(c(1,1,2,2),
                     c(2,2,1,1),
                     c(1,1,2,2),
                     c(2,2,1,1),
                     c(1,2,2,1),
                     c(2,1,1,2)))
  design2 <- t(rbind(c(1,1,2,1),
                     c(2,2,1,2),
                     c(1,1,2,1),
                     c(2,2,1,2),
                     c(1,2,2,1),
                     c(2,1,1,2)))
  design3 <- t(rbind(c(1,1,2,2),
                     c(2,2,1,1),
                     c(1,1,2,2),
                     c(2,2,1,1),
                     c(1,1,2,2),
                     c(2,2,1,1)))
  model <- 1
  v <- 2
  H <- crossover:::linkMatrix(model=1, v=2)
  for (design in c(design1, design2, design3)) {
    rcD <- crossover:::createRowColumnDesign(design, model=model) # C-Code
    X <- crossover:::getRCDesignMatrix(rcD, v*v+v) # R-Code
    A <- crossover:::getInfMatrixOfDesign(X, v+v*v) # R-Code
    A <- crossover:::getInfMatrixOfDesign(X, v+v*v, method=2) # R-Code
    A <- .Call("getInfMatrix", rcD, v, model, PACKAGE = "crossover")
    rcD
    X
    A
    t(H)%*%A%*%H
  }
}