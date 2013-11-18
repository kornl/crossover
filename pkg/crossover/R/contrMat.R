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