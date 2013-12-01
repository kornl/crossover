contrMat2 <- function(type, v, model, eff.factor) {
  model <- getModelNr(model)
  if (type %in% c("Dunnett", "Tukey")) {
    Csub <- contrMat(n=rep(1, v), type=type)
    class(Csub) <- "matrix"
    C <- crossover:::appendZeroColumns(Csub, model=model, v)
    if (length(eff.factor)<=1 || all(eff.factor[-1]==0) || model ==3) {
      return(C)
    }
    Csub2 <- contrMat(n=rep(1, v), type="Tukey")
    class(Csub2) <- "matrix"
    m <- matrix(0,dim(Csub)[1],v) # Csub is correct! Not Csub2.
    if (model %in% c(1, 4, 5, 6)) { # v+v parameters
      C <- rbind(C*eff.factor[1], cbind(m, Csub2)*eff.factor[2])
    } else if (model %in% c(2, 8)) { # v+v+v parameters
      C <- rbind(C*eff.factor[1], cbind(m, Csub2, matrix(0,dim(Csub2)[1],v))*eff.factor[2])
      C <- rbind(C*eff.factor[1], cbind(m, matrix(0,dim(Csub2)[1],v), Csub2)*eff.factor[2])      
    } else if (model %in% c(7)) { # Full set of interactions v+v+v^2
      #C <- rbind(C)
      # TODO
    }
    return(C)
    
  }
  stop("Unrecognized argument for 'type'.")
}

corMat <- function(correlation, s, p, rho) {
  if (correlation=="equicorrelated") {
    V <- diag(p)
    for (i in 1:p) {
      for (j in 1:p) {
        if (i!=j) {
          V[i,j] <- rho
        }
      }
    }
  } else if (correlation=="autoregressive") {
    V <- diag(p)
    for (i in 1:p) {
      for (j in 1:p) {
        V[i,j] <- rho^abs(i-j)
      }
    }
  }
  # Our design matrix is indexed p=1,1,1,2,2,2,3,3,3; s=1,2,3,1,2,3,1,2,3 therefore we have to exchange the arguments:
  sigmaI <- kronecker(solve(V), diag(s)) #kronecker(diag(s), f(V))
  return(sigmaI)
}