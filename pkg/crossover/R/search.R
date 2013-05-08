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

getInfMatrixOfDesign <- function(X, v, method) {
  #if (!is.numeric(X) || max(X)!=v) {
  #  X <- matrix(as.numeric(as.factor(X)), dim(X)[1])  
  #}
  r <-sapply(1:v, function(x) {sum(X==x)})
  p <- dim(X)[1]
  s <- dim(X)[2]
  NP <- getNp(X, v) # t times p label row incidence matrix
  NS <- getNs(X, v) # t times s label column incidence matrix
  if (missing(method) || method==1) {
   A <- diag(r) - (1/s)* NP %*% t(NP) - (1/p)* NS %*% t(NS) + (1/(p*s))* r %*% t(r)
  } else {    
    Xr <- getRCDesignMatrix(rcDesign, v)
    # JRW, p 2650, second equation on that page, number 11
    A <- t(Xr) %*% (diag(s*p)-getPZ(s,p)) %*% Xr
  }
  return(A)
}

# D has to be numeric (integer) matrix with values 1, ..., v
getTDesign <- function(D) {
  v <- max(D)
  X <- matrix(0, prod(dim(D)), v)
  for (i in 1:dim(D)[1]) {
    for (j in 1:dim(D)[2]) {
      X[j+(i-1)*v, D[i,j]] <- 1
    }
  }
  return(X)
}

getRCDesignMatrix <- function(rcDesign, v) {
  X <- matrix(0, prod(dim(rcDesign)), v)
  for (j in 1:(dim(rcDesign)[2])) {
    for (i in 1:(dim(rcDesign)[1])) {
      X[(i-1)*(dim(rcDesign)[2])+j,rcDesign[i,j]] <- 1
    }
  }
  return(X)
}

# D has to be numeric (integer) matrix with values 1, ..., v
getNp <- function(D, v) {
  #v <- max(D)
  Np <- matrix(0, v, dim(D)[1])
  for (i in 1:dim(D)[1]) {
    for (j in 1:v) {
      Np[j,i] <- sum(D[i,]==j)
    }
  }
  return(Np)
}

# block design matrix
getZ <- function(s, p) {
  # Z x (p_1, ..., p_p, s_1, ..., s_s)
  return(cbind(kronecker(diag(p), matrix(1,s,1)),kronecker(matrix(1,p,1),diag(s))))
}

getPZ <- function(s,p) {
  Z <- getZ(s,p)
  return(Z %*% ginv(t(Z) %*% Z) %*% t(Z))
}

# D has to be numeric (integer) matrix with values 1, ..., v
getNs <- function(D, v) {
  #v <- max(D)
  Ns <- matrix(0, v, dim(D)[2])
  for (i in 1:dim(D)[2]) {
    for (j in 1:v) {
      Ns[j,i] <- sum(D[,i]==j)
    }
  }
  return(Ns)
}

searchCrossOverDesignCTest <- function() {
  s <- 4
  p <- 4
  v <- 4
  model <- "Standard additive model"
  eff.factor <- NULL
  v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  balance.s=FALSE 
  balance.p=FALSE
  verbose=TRUE
  design <- matrix(sample(rep(1:v, v.rep)), p, s)
  Csub <- contrMat(n=rep(1, v), type="Tukey")
  class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
  C <- as.matrix(bdiag(Csub,Csub))  
  CC <- t(C) %*% C
  H <- linkMatrix(model, v)
  .Call( "searchCOD", s, p, v, design, H, CC, model, eff.factor, v.rep, balance.s, balance.p, verbose, PACKAGE = "crossover" )
}

searchCrossOverDesign <- function(s, p, v, model="Standard additive model", eff.factor, v.rep, balance.s=FALSE, balance.p=FALSE, verbose=TRUE) {
  if (missing(v.rep)) {
    v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  } else if (sum(v.rep)!=s*p) { # TODO Feature: Allow NA or sum(v.rep)<s*p
    stop("The sum of argument v.rep must equal s times p.")
  }
  # random start design (respecting v.rep)
  design <- matrix(sample(rep(1:v, v.rep)), p, s)
  #iMatrix <- getInfMatrixOfDesign(design)
  eOld <- 0
  varOld <- Inf
  # precalculations that are needed in every step
  Csub <- contrMat(n=rep(1, v), type="Tukey")
  class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
  C <- as.matrix(bdiag(Csub,Csub))  
  CC <- t(C) %*% C
  H <- linkMatrix(model, v)
  for (i in 1:100) {
    oldDesign <- design    
    #print(design)
    while (all(oldDesign==design)) {
      ij <- ceiling(runif(4)*c(p,s,p,s))    
      tmp <- design[ij[1],ij[2]]
      design[ij[1],ij[2]] <- design[ij[3],ij[4]]
      design[ij[3],ij[4]] <- tmp
    }
    #print(design)
    rcDesign <- createRowColumnDesign(design)
    Ar <- getInfMatrixOfDesign(rcDesign, v+v*v)
    #print(Ar)    
    S2 <- 1 # We set this constant for the moment
    S1 <- sum(diag(ginv(t(H) %*% Ar %*% H) %*% CC)) #TODO t(C) %*% C can be calculated outside the loop   
    #print(ginv(t(H) %*% Ar %*% H) %*% t(C) %*% C)
    gco <- general.carryover(t(design), model=1)
    var <- sum(gco$Var.trt.pair[lower.tri(gco$Var.trt.pair)]) + sum(gco$Var.car.pair[lower.tri(gco$Var.car.pair)])
    #
    cat(S2/S1, " vs. ", eOld, " ")    
    if (S2/S1 > eOld) {
      cat("=> Accepting new matrix.\n")
      eOld <- S2/S1
      if (varOld < var) cat("********** BUT: ",var," > ",varOld," *****************\n")
      varOld <- var
    } else {
      cat("=> Keeping old matrix.\n")
      design <- oldDesign       
      if (varOld > var) cat("********** BUT: ",var," < ",varOld," *****************\n")
      var <- varOld
    }
  }  
  return(design)
}

