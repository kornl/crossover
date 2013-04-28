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

createRowColumnDesign <- function(X, v=length(unique(as.character(X)))) {
  if (!is.numeric(X) || max(X)!=v) {
    X <- matrix(as.numeric(as.factor(X)), dim(X)[1])  
  }
  rcDesign <- X + v*rbind(0, X[-dim(X)[1],])
}

getInfMatrixOfRCDesign <- function(X, r, s, p) { #, Z, method) {
  nr <- dim(X)[1]
  NP <- # t times p label row incidence matrix
  NS <- # t times s label column incidence matrix
  #if (missing(method) || method==1) {
  A <- diag(r) - (1/s)* NP %*% t(NP) - (1/p)* NS %*% t(NS) + (1/(p*s))* r %*% t(r)
  #} else {    
  #  P <- Z %*% ginv(t(Z) %*% Z) %*% t(Z)
  #  return(t(X) %*% (diag(nr)-P) %*% X)
  #}
}

myInv <- ginv(createRowColumnDesign(D))

# D has to be numeric (integer) matrix with values 1, ..., v
getTDesign <- function(D) {
  v <- dim(D)[2]
  X <- matrix(0, prod(dim(D)), max(D))
  for (i in 1:dim(D)[1]) {
    for (j in 1:v) {
      X[j+(i-1)*v, D[i,j]] <- 1
    }
  }
  return(X)
}

getBDesign <- function(D, model) {
  
}

searchCrossOverDesign <- function(s, p, v, model="Standard additive model", eff.factor, v.rep, balance.s=FALSE, balance.p=FALSE) {
  if (missing(v.rep)) {
    v.rep = rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  } else if (sum(v.rep)!=s*p) { # TODO Feature: Allow NA or sum(v.rep)<s*p
    stop("The sum of argument v.rep must equal s times p.")
  }
  # random start design (respecting v.rep)
  design <- matrix(sample(rep(1:v, v.rep)), p, s)
  rcDesign <- createRowColumnDesign(design)
  iMatrix <- getInfMatrixOfRCDesign(rcDesign, v.rep, s, p)
  return(design)
}
