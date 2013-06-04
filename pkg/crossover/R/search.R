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

createRowColumnDesign <- function(X, v=length(unique(as.character(X))), model, ppp=0.5, placebos=1) {
  model <- getModelNr(model)
  return(.Call( "createRCD", X, v, model, PACKAGE = "crossover" ))
}

searchCrossOverDesign <- function(s, p, v, model="Standard additive model", eff.factor=1, v.rep, balance.s=FALSE, balance.p=FALSE, verbose=FALSE, model.param=list(), n=c(5000, 20), jumps=c(5, 50), contrast) {
  #seed <<- .Random.seed #TODO Do not forget to remove this after testing! :)
  if (length(n)==1) n <- c(n, 20)
  if (length(jumps)==1) jumps <- c(jumps, 50)
  model <- getModelNr(model)
  if (missing(v.rep)) {
    v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  } else if (sum(v.rep)!=s*p) { # TODO Feature: Allow NA or sum(v.rep)<s*p
    stop("The sum of argument v.rep must equal s times p.")
  }
  if (balance.s && balance.p) stop("Balancing sequences AND periods simultaneously is a heavy restriction and not supported (yet?).")
  designL <- list() # In this list we save 20 random start designs.
  for (i in 1:n[2]) {    
    designL[[i]] <- randomDesign(s, p, v,  v.rep, balance.s, balance.p)
  }
  if (missing(contrast)) {
    Csub <- contrMat(n=rep(1, v), type="Tukey")
    class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
    C <- appendZeroColumns(Csub, model, v)
  } else {
    C <- contrast
  }
  CC <- t(C) %*% C
  H <- do.call( linkMatrix, c(list(model=model, v=v), model.param) )
  #H <- linkMatrix(model, v)
  
  result <- .Call( "searchCOD", s, p, v, designL, H, CC, model, eff.factor, v.rep, balance.s, balance.p, verbose, n, jumps, PACKAGE = "crossover" )
  design <- result$design
  eff <- result$eff
  
  varTrtPair <- paste(capture.output(print(general.carryover(t(design), model=model))), collapse = "\n")
  return(list(design=design, varTrtPair=varTrtPair, eff=eff, search=list(n=n, jumps=jumps)))
}

randomDesign <- function(s, p, v,  v.rep, balance.s=FALSE, balance.p=FALSE) {
  if (missing(v.rep)) {
    v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  }
  if (balance.s) {
    design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:s,p)), sample)), p, s)
  } else if (balance.p) {
    design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:p,s)), sample)), p, s, byrow=TRUE)
  } else {
    design <- matrix(sample(rep(1:v, v.rep)), p, s)
  }  
  return(design)
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

getValues <- function(design, model=1, C, v=max(design)) {
  if (missing(C)) {
    Csub <- contrMat(n=rep(1, v), type="Tukey")
    class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
    C <- cbind(Csub,matrix(0,dim(Csub)[1],v)) 
    CC <- t(C) %*% C
  }
  rcDesign <- createRowColumnDesign(design, model=model)
  Ar <- getInfMatrixOfDesign(rcDesign, v+v*v)
  H <- linkMatrix(model, v)
  return(diag(ginv(t(H) %*% Ar %*% H) %*% CC))  
}

dput2 <- function(x) {
  paste(capture.output(dput(x)), collapse = " ")
}

searchPlot <- function(x, type=1, show.jumps=FALSE) {    
  eff <- unlist(x$eff)
  run <- as.factor(rep(1:length(x$eff), each=length(x$eff[[1]])))
  n <- 1:(length(x$eff[[1]])*length(x$eff))
  n2 <- rep(1:length(x$eff[[1]]), times=length(x$eff))
  d <- data.frame(eff=eff, run=run, n=n, n2=n2)
  n <- x$search$n
  jumps <- x$search$jumps
  if (type==1) {
    plot <- ggplot(d, aes(x=n, y=eff, colour=run)) + geom_point()
    if (show.jumps) plot <- plot + geom_vline(xintercept = 1:((n[1]*n[2])/jumps[2])*jumps[2], colour=grey)
  } else {
    plot <-ggplot(d, aes(x=n2, y=eff)) + geom_point(colour="#444499", size=1) + geom_abline(intercept = max(d$eff), slope = 0) + facet_wrap( ~ run)
  }
  return(plot)
}