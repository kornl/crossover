test.search <- function () {
  for (model in 1:8) {
    result <- searchCrossOverDesign(s=9, p=5, v=4, model=4, eff.factor=1, n=c(100,5))
  }
}

test.strangeDesignInputs <- function() {
  s <- 4 # number of sequences
  p <- 4 # number of periods
  v <- 4 # number of treatments
  
  D <- rbind(c("A","B","C","D"),
             c("B","C","D","A"),
             c("C","D","A","B"),
             c("D","A","B","C"))
  
  D <- matrix(as.numeric(as.factor(D)), dim(D)[1])  
  
  myInv <- ginv(createRowColumnDesign(D, model=1))
  
}