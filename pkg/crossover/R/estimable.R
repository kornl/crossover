# design <- 
estimable <- function(design, model, x, v) {
  rcD <- crossover:::createRowColumnDesign(design, model=model)
  X <- crossover:::getRCDesignMatrix(rcD, v*v+v)
  rankMatrix(X)
  all.equal(t(x)%*%ginv(t(X)%*%X)%*%t(X)%*%X, x)
}