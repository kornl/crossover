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
    rcD1 <- crossover:::createRowColumnDesignR(design, model=model) # R-Code
    rcD2 <- crossover:::createRowColumnDesign(design, model=model) # C-Code
    all(rcD1==rcD2)
    X1 <- rcD1
    #X1 <- crossover:::getRCDesignMatrix(rcD1, v*v+v) # R-Code
    A1 <- crossover:::getInfMatrixOfDesign(X1, v+v*v) # R-Code
    A1b <- crossover:::getInfMatrixOfDesign(X1, v+v*v, method=2) # R-Code
    all(A1==A1b)
    Csub <- contrMat(n = rep(1, v), type = "Tukey")
    C <- as.matrix(cbind(Csub, matrix(0, dim(Csub)[1], v)))
    general.carryover(design, model=model)
    diag(C %*% ginv(t(H) %*% A1 %*% H) %*% t(C))
    diag(ginv(t(H) %*% A1 %*% H) %*% t(C) %*% C)
    A2 <- .Call("getInfMatrix", X1, v+v^2, PACKAGE = "crossover") # C-Code
    A2
    rcD1
    X1
    A1
    t(H)%*%A1%*%H
  }
  general.carryover(design1, model=model)
}