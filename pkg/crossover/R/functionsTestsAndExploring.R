compareApproaches <- function(design) {
  v <- max(design)
  print(design)
  Csub <- contrMat(n=rep(1, v), type="Tukey")
  class(Csub) <- "matrix"
  C2 <- as.matrix(bdiag(Csub,Csub))
  C3 <- as.matrix(bdiag(Csub,Csub,Csub))
  C5 <- as.matrix(bdiag(Csub,matrix(0,dim(Csub)[1],4*v)))  
  
  # JRW, p 2650, first equation on that page, whithout number
  rcDesign <- createRowColumnDesign(design, model=1)
  Ar2 <- getInfMatrixOfDesign(rcDesign, v+v^2)
  rcDesign <- createRowColumnDesign(design, model=8)
  Ar3 <- getInfMatrixOfDesign(rcDesign, v+v^2+v^3)
  
  for (model in c(1,2,3,4,5,6,7,8)) {
    cat(models[model],":\n")
    if (model %in% c(2,8)) {      
      #C <- as.matrix(cbind(Csub, matrix(0, dim(Csub)[2], 2*v)))      
      C <- C3
    } else if (model==3) {
      C <- Csub      
    } else if (model==7) {
      C <- C5
    } else {      
      #C <- as.matrix(cbind(Csub, matrix(0, dim(Csub)[2], v)))   
      C <- C2
    }
    if (model==8) {
      Ar <- Ar3
    } else {
      Ar <- Ar2
    }
    H <- linkMatrix(model=model, v)
    var1 <- sum(diag(C %*% ginv(t(H) %*% Ar %*% H) %*% t(C)))
    cat(diag(C %*% ginv(t(H) %*% Ar %*% H) %*% t(C)),"\n")
    
    gco <- general.carryover(t(design), model=model)
    print(gco$Var.trt.pair)
    if (model %in% c(2,8)) {      
      var2 <- sum(gco$Var.trt.pair[lower.tri(gco$Var.trt.pair)]) + sum(gco$Var.car.pair.1[lower.tri(gco$Var.car.pair.1)]) + sum(gco$Var.car.pair.2[lower.tri(gco$Var.car.pair.2)])
      print(gco$Var.car.pair.1) 
      print(gco$Var.car.pair.2)
    } else if (model %in% c(3,7)) {
      var2 <- sum(gco$Var.trt.pair[lower.tri(gco$Var.trt.pair)])
    } else {
      var2 <- sum(gco$Var.trt.pair[lower.tri(gco$Var.trt.pair)]) + sum(gco$Var.car.pair[lower.tri(gco$Var.car.pair)])
      print(gco$Var.car.pair)
    }
    
    cat("Difference: ",abs(var1-var2),"\n\n")
  }
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
    Xr <- getRCDesignMatrix(X, v) #TODO Test this - is X here correct?
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
  verbose=FALSE
  design <- matrix(sample(rep(1:v, v.rep)), p, s)
  Csub <- contrMat(n=rep(1, v), type="Tukey")
  class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
  C <- as.matrix(bdiag(Csub,Csub))  
  CC <- t(C) %*% C
  H <- linkMatrix(model, v)
  .Call( "searchCOD", s, p, v, design, H, CC, model, eff.factor, v.rep, balance.s, balance.p, verbose, 50000, PACKAGE = "crossover" )
}

searchCrossOverDesignR <- function(s, p, v, model="Standard additive model", eff.factor, v.rep, balance.s=FALSE, balance.p=FALSE, verbose=FALSE, ppp=0.5, placebos=1) {
  seed <<- .Random.seed #TODO Do not forget to remove this after testing! :)
  model <- getModelNr(model)
  if (missing(v.rep)) {
    v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  } else if (sum(v.rep)!=s*p) { # TODO Feature: Allow NA or sum(v.rep)<s*p
    stop("The sum of argument v.rep must equal s times p.")
  }
  # random start design (respecting v.rep)
  if (balance.s && balance.p) stop("Balancing sequences AND periods simultaneously is a heavy restriction and not supported (yet?).")
  designL <- list()
  for (i in 1:20) {
    if (balance.s) {
      design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:s,p)), sample)), p, s)
    } else if (balance.p) {
      design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:p,s)), sample)), p, s, byrow=TRUE)
    } else {
      design <- matrix(sample(rep(1:v, v.rep)), p, s)
    }  
    designL[[i]] <- design
  }
  Csub <- contrMat(n=rep(1, v), type="Tukey")
  class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
  C <- as.matrix(bdiag(Csub,Csub))  
  CC <- t(C) %*% C
  H <- linkMatrix(model, v)  
  #iMatrix <- getInfMatrixOfDesign(design)
  eOld <- 0
  varOld <- Inf
  # precalculations that are needed in every step    
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
    rcDesign <- createRowColumnDesign(design, model=model)
    Ar <- getInfMatrixOfDesign(rcDesign, v+v*v)
    #print(Ar)    
    S2 <- 1 # We set this constant for the moment
    S1 <- sum(diag(ginv(t(H) %*% Ar %*% H) %*% CC))   
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
  varTrtPair <- paste(capture.output(print(general.carryover(t(design), model=model))), collapse = "\n")
  return(list(design=design, varTrtPair=varTrtPair))
}
