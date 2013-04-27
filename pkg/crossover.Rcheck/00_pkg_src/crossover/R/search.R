library(expm)
library(MASS) # ginv

#c <- 1
s <- 4 # number of sequences
p <- 4 # number of periods
v <- 4 # number of treatments

D <- rbind(c("A","B","C","D"),
           c("B","C","D","A"),
           c("C","D","A","B"),
           c("D","A","B","C"))

linkMatrix <- function(model, v) {
  if(missing(v)) stop("Please specify number of treatments")
  mI <- diag(v)
  m1 <- matrix(1,v,1)
  m0 <- matrix(0, v, v)
  if(model=="Standard additive model") {
    return(rbind(cbind(mI, m0), 
                 cbind(kronecker(m1,mI),kronecker(mI,m1))))
  }
  if(model=="Second-order carry-over effects") {
    return(rbind(cbind(mI,m0,m0),
                 cbind(kronecker(m1,mI),kronecker(mI,m1),matrix(0,v*v,v)),
                 cbind(kronecker(kronecker(m1,m1),mI), kronecker(kronecker(m1,mI),m1),kronecker(kronecker(mI,m1),m1))))
  }
  if(model=="Full set of interactions") {
    #return(rbind(linkMatrix("Standard additive model", v),
    #             ))
  }
  if(model=="Self-adjacency model") {
    
  }
  if(model=="Placebo model") {
    
  }
  if(model=="No carry-over into self model") {
    
  }
  if(model=="Treatment decay model") {
    
  }
  if(model=="Proportionality model") {
    
  }
}

models <- c("Standard additive model",
            "Second-order carry-over effects",
            "Full set of interactions",
            "Self-adjacency model",
            "Placebo model",
            "No carry-over into self model",
            "Treatment decay model",
            "Proportionality model")
#"No carry-over effects")

createRowColumnDesign <- function(X, v=unique(as.character(X))) {
  X <- matrix(as.numeric(as.factor(D)), dim(D)[1])
  
}

getInfMatrixOfRCDesign <- function(X, Z, method) {
  if (missing(method) || method==1) {
    
  } else {
    nr <- dim(X)[1]
    P <- Z %*% ginv(t(Z) %*% Z) %*% t(Z)
    return(t(X) %*% (diag(nr)-P) %*% X)
  }
}

myInv <- ginv(createRowColumnDesign(D))

searchCrossOverDesign <- function(s, p, v, model="Standard additive model", eff.factor, v.rep, balance.s=FALSE, balance.p=FALSE) {
  if (sum(v.rep)!=s*p) { # TODO Feature: Allow NA or sum(v.rep)<s*p
    stop("The sum of argument v.rep must equal s times p.")
  }
  
}
