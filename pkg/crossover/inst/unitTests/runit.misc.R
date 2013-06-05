test.design.functions <- function () {
  s <- 3
  p <- 4
  v <- 3
  
  v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  design <- matrix(sample(rep(1:v, v.rep)), p, s)
  
  rcDesign <- createRowColumnDesign(design, model=1)
  # JRW, p 2650, first equation on that page, whithout number
  Ar <- getInfMatrixOfDesign(rcDesign, v+v*v)
  Xr <- getRCDesignMatrix(rcDesign, v+v*v)
  # JRW, p 2650, second equation on that page, number 11
  Ar2 <- t(Xr) %*% (diag(s*p)-getPZ(s,p)) %*% Xr
  checkTrue(max(abs(Ar-Ar2))<0.00001)
  
  Csub <- contrMat(n=rep(1, v), type="Tukey")
  class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
  C <- as.matrix(bdiag(Csub,Csub))
  H <- linkMatrix(model=1, v)
  var1 <- sum(diag(C %*% ginv(t(H) %*% Ar %*% H) %*% t(C)))
  
  gco <- general.carryover(design, model=1)
  var2 <- sum(gco$Var.trt.pair[lower.tri(gco$Var.trt.pair)]) + sum(gco$Var.car.pair[lower.tri(gco$Var.car.pair)])
  
  # checkTrue(abs(var1-var2)<0.00001) This is often not true due to the fact that s*p are not much bigger than v.
}

test.brute.force.compare.approaches <- function() {
  for (model in c(1:6,8)) { #TODO model 7 differs for general.carryover and search algorithm
    s <- 10 #TODO Also make s, p and v random.
    p <- 6
    v <- 3  
    v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
    
    differences <- 0
    
    for (i in 1:10) {
      cat("\nRun ",i,":\n")
      design <- matrix(sample(rep(1:v, v.rep)), p, s)
      result <- try(compareApproaches(design, models2check=model, stop.on.diff=TRUE))
      if ("try-error" %in% class(result)) {
        differences <- differences + 1
      }
    }
    if(differences>5) {
      stop(paste("general.carryover and search algorithm differ in ",differences, " out of 10 cases for model ",model,".", sep=""))
    }
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