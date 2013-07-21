# ppp=proportionality parameter
linkMatrix <- function(model, v, ppp=0.5, placebos=1) {
  model <- getModelNr(model)
  if(missing(v)) stop("Please specify number of treatments")
  mI <- diag(v)
  m1 <- matrix(1,v,1)
  m0 <- matrix(0, v, v)
  if(model=="Standard additive model" || model==1) { #TODO Convert the string comparisons to comments.
    return(rbind(cbind(mI, m0), 
                 cbind(kronecker(m1,mI),kronecker(mI,m1))))
  }
  if(model=="Second-order carry-over effects" || model==8) {
    return(rbind(cbind(mI,m0,m0),
                 cbind(kronecker(m1,mI),kronecker(mI,m1),matrix(0,v*v,v)),
                 cbind(kronecker(kronecker(m1,m1),mI), kronecker(kronecker(m1,mI),m1),kronecker(kronecker(mI,m1),m1))))
  }
  if(model=="Full set of interactions" || model==7) {
    M <- matrix(0, sum(1:v)*2, v*v)    
    for (j in (v+1):(sum(1:v)*2)) {
      jv <- (j-1)%/%v
      M[j, v*(j-1-v*jv)+jv] <- 1
    }
    return(cbind(linkMatrix("Standard additive model", v), M))
  }
  if(model=="Self-adjacency model" || model==2) {
    M <- cbind(linkMatrix("Standard additive model", v), matrix(0, sum(1:v)*2, v))
    for (j in (v+1):(sum(1:v)*2)) {
      jv <- (j-1)%/%v      
      if (jv==j-v*jv) {
        M[j,v+jv] <- 0
        M[j,2*v+jv] <- 1
      }
    }
    return(M)
  }
  if(model=="Placebo model" || model==4) {
    M <- matrix(0, sum(1:v)*2, 2*v)     
    for (j in 1:(sum(1:v)*2)) {
      jv <- (j-1)%/%v
      M[j,j-v*jv] <- 1
      if (j>v*(placebos+1)) {
        M[j,v+jv] <- 1
      }
    }
    return(M)
  }
  if(model=="No carry-over into self model" || model==5) {
    M <- linkMatrix("Standard additive model", v)
    for (j in (v+1):(sum(1:v)*2)) {
      jv <- (j-1)%/%v
      if (jv==j-v*jv) {
        M[j,v+jv] <- 0
      }
    }
    return(M)
  }
  if(model=="Treatment decay model" || model==6) {
    M <- matrix(0, sum(1:v)*2, 2*v)     
    for (j in 1:(sum(1:v)*2)) {
      jv <- (j-1)%/%v
      M[j,j-v*jv] <- 1
      if (j>v && jv==j-v*jv) {
        M[j,v+jv] <- -1
      }
    }
    return(M)
  }
  if(model=="Proportionality model" || model==3) {
    M <- matrix(0, sum(1:v)*2, v) 
    M[1:v,1:v] <- diag(v)
    for (j in (v+1):(sum(1:v)*2)) {
      jv <- (j-1)%/%v
      if (jv==j-v*jv) {
        M[j, jv] <- 1+ppp
      } else {
        M[j, j-v*jv] <- 1
        M[j, jv] <- ppp
      }
    }
    return(M)
  }
  stop(paste("Sorry model \"",model,"\" is not known.", sep=""))
}

models <- c("Standard additive model",
            "Self-adjacency model",
            "Proportionality model",
            "Placebo model",
            "No carry-over into self model",
            "Treatment decay model",
            "Full set of interactions",
            "Second-order carry-over effects")
#"No carry-over effects")

getModelNr <- function(model) {
  if (is.numeric(model)) {
    if (model %in% 1:8) {
      return(model)
    } else {
      stop("Model must be number between 1 and 8.")
    }
  }
  model <- which(models==model)
  if (length(model)==0) stop("Unknown model.")
  return(model)
}

createRowColumnDesign <- function(X, v, model) {
  model <- getModelNr(model)
  return(.Call( "createRCD", X, v, model, PACKAGE = "crossover" ))
}

searchCrossOverDesign <- function(s, p, v, model="Standard additive model", eff.factor=1,
                                  v.rep, balance.s=FALSE, balance.p=FALSE, verbose=0, model.param=list(), 
                                  n=c(5000, 20), jumps=c(5, 50), start.designs, contrast) {
  #seed <<- .Random.seed #TODO Do not forget to remove this after testing! :)
  start.time <- proc.time()
  if (length(n)==1) {
    if (missing(start.designs)) { n <- c(n, 20) } else { n <- c(n, length(start.designs)) }
  }
  if (length(jumps)==1) jumps <- c(jumps, 50)
  model <- getModelNr(model)
  
  H <- do.call( linkMatrix, c(list(model=model, v=v), model.param) )
  
  if (missing(v.rep)) {
    v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  } else if (sum(v.rep)!=s*p) { # TODO Feature: Allow NA or sum(v.rep)<s*p
    stop("The sum of argument v.rep must equal s times p.")
  }
  if (balance.s && balance.p) stop("Balancing sequences AND periods simultaneously is a heavy restriction and not supported (yet?).")  
  if (missing(contrast)) {
    Csub <- contrMat(n=rep(1, v), type="Tukey")
    class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
    C <- appendZeroColumns(Csub, model, v)
  } else {
    C <- contrast
  }
  if (missing(start.designs)) { start.designs <- list() }  # In this list we save n[2] random start designs.
  if (isTRUE(start.designs %in% c("catalog","catalogue"))) { 
    st <- buildSummaryTable()
    loadAllDatasets() # TODO Is this clever?
    start.designs <- lapply(st[st$t==v & st$p==p & st$s==s,]$dataset, get)
  }
  i <- length(start.designs) + 1
  while (i <= n[2]) {    
    start.designs[[i]] <- randomDesign(s, p, v,  v.rep, balance.s=balance.s, balance.p=balance.p, model=model, C=C)
    i <- i + 1
  }
  if (length(start.designs)!=n[2]) { warning(paste("Too many start designs specified. Only the first ", n[2], " will be used.", sep="")) }

  CC <- t(C) %*% C

  if (model==8) { # Second-order carry-over effects
      r <- c(rep(s/v, v), rep((p-1)*s/v^2, v^2), rep((p-2)*s/v^3, v^3))
  } else {
      r <- c(rep(s/v, v), rep((p-1)*s/v^2, v^2))
  }
  S2 <- sum(diag(ginv(t(H) %*% diag(r) %*% H) %*% CC))
  
  result <- .Call( "searchCOD", s, p, v, start.designs, H, C, model, eff.factor, v.rep, balance.s, balance.p, verbose, n, jumps, S2, PACKAGE = "crossover" )
  design <- result$design
  
  time <- proc.time()-start.time
  class(time) <- NULL
  #varTrtPair <- paste(capture.output(print(general.carryover(t(design), model=model))), collapse = "\n")
  #return(list(design=design, varTrtPair=varTrtPair, eff=eff, search=, time=))
  return(new("crossoverSearchResult", design=new("crossoverDesign", design, v=v, model=model, description="Found by search algorithm"), startDesigns=start.designs, eff=result$eff,                   
             search=list(n=n, jumps=jumps), model=model, time=time, misc=list()))
}

randomDesign <- function(s, p, v,  v.rep, balance.s=FALSE, balance.p=FALSE, model, C) {
  if (missing(v.rep)) {
    v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  }
  design <- matrix(1, p, s)
  i <- 0
  while (!estimable(design, v, model, C)) {   
    i <- i + 1
    if (i>1000) stop("Could not find design that allows estimation of contrasts after 1000 tries.")
    if (balance.s) {
      design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:s,p)), sample)), p, s)
    } else if (balance.p) {
      design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:p,s)), sample)), p, s, byrow=TRUE)
    } else {
      design <- matrix(sample(rep(1:v, v.rep)), p, s)
    }
  }
  return(design)
}

estimable <- function(design, v, model, C) {
  if(missing(C)) {
    Csub <- contrMat(n=rep(1, v), type="Tukey")
    class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
    C <- appendZeroColumns(Csub, model, v)
  }
  rcDesign <- createRowColumnDesign(design, v=v, model=model)
  Xr <- getRCDesignMatrix(rcDesign, v+v*v)
  H <- linkMatrix(model, v)
  X <- Xr %*% H
  XX <- t(X) %*% X
  return(isTRUE(all.equal(C %*% ginv(XX) %*% XX, C, check.attributes=FALSE, check.names=FALSE))) # Criterion to test whether - see Theorem \ref{thr:estimable} of vignette.
}

appendZeroColumns <- function(Csub, model, v) {
  if (model %in% c(2,8)) {
    C <- as.matrix(cbind(Csub, matrix(0, dim(Csub)[1], 2*v)))
  } else if (model==3) {
    C <- Csub
  } else if (model==7) {
    C <- as.matrix(cbind(Csub,matrix(0,dim(Csub)[1], 4*v)))
  } else {
    C <- as.matrix(cbind(Csub, matrix(0,dim(Csub)[1], v)))
  }  
  return(C)
}

getTrtPair <- function(design, model=1) {
  gco <- general.carryover(t(design), model=model)
  return(triu(gco$Var.trt.pair))
}

getValues <- function(design, model=1, C, v) {
  if (missing(C)) {
    Csub <- contrMat(n=rep(1, v), type="Tukey")
    class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
    C <- cbind(Csub,matrix(0,dim(Csub)[1],v)) 
    CC <- t(C) %*% C
  }
  rcDesign <- createRowColumnDesign(design, v, model=model)
  Ar <- getInfMatrixOfDesign(rcDesign, v+v*v)
  H <- linkMatrix(model, v)
  return(diag(ginv(t(H) %*% Ar %*% H) %*% CC))  
}

dput2 <- function(x) {
  paste(capture.output(dput(x)), collapse = " ")
}