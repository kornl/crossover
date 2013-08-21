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

#' Get the number or character string specifying the model
#' 
#' Get the number or character string specifying the model
#'
#' @param model Number or character string specifying the model
#' @param type Eiher \code{"numeric"} or \code{"character"}. If numeric the number of the model will be returned.
#' Otherwise the character string description of the model.
#' @return Either number or character string specifying the model.
#' @examples
#' crossover:::getModelNr("Self-adjacency model")==crossover:::getModelNr(2)
#' "Self-adjacency model"==crossover:::getModelNr(2, type="character")
#' crossover:::getModelNr("Self-adjacency model")==2
getModelNr <- function(model, type="numeric") {
    if (type!="numeric") {
        if (type=="character") {
            model <- models[getModelNr(model)]
            return(model)
        } else {
            stop("Parameter type must be either \"numeric\" or \"character\".")
        }
    }
    if (is.numeric(model)) {
        if (model %in% 1:8) {
            return(model)
        } else {
            stop("Model must be number between 1 and 8.")
        }
    }
    modelNr <- which(models==model)
    if (length(modelNr)==0) stop(paste("Unknown model \"", model ,"\".", sep=""))
    return(modelNr)
}

#' Create a row column design 
#'
#' @param X cross-over design
#' @param v number of treatments
#' @param model String or number describing the model. See \code{\link{getModelNr}}.
#' @return A row-column design (as matrix - but not the design matrix).
#' @seealso \code{\link{rcdMatrix}} gives the row-column design matrix.
#' @examples
#' # TODO
rcd <- function(X, v, model) {
  model <- getModelNr(model)
  return(.Call( "rcd2R", X, v, model, PACKAGE = "crossover" ))
}

#' Create the design matrix for a given row column design 
#'
#' @param X row-column design
#' @param v number of treatments
#' @param model String or number describing the model. See \code{\link{getModelNr}}.
#' @return The design matrix for a row-column design.
#' @seealso \code{\link{rcd}} gives the row-column design to a given crossover design.
#' @examples
#' # TODO
rcdMatrix <- function(X, v, model) {
    if (length(levels(as.factor(X)))<=v) warning("It looks like you called rcdMatrix with a crossover design,\nbut you should provide the row-column design.")
    model <- getModelNr(model)
    return(.Call( "rcdMatrix2R", X, v, model, PACKAGE = "crossover" ))
}

infMatrix <- function(X, v, model) {
    model <- getModelNr(model)
    return(.Call( "infMatrix2R", X, v, model, PACKAGE = "crossover" ))
}


#' Search for a Cross-Over Design
#' 
#' Search for a Cross-Over Design
#' 
#' See the vignette of this package for further details.
#' 
#' @param s Number of sequences.
#' @param p Number of periods.
#' @param v Number of treatments.
#' @param model Model - one of the following: "Standard additive model" (2),
#' "Second-order carry-over effects" (3), "Full set of interactions" (3),
#' "Self-adjacency model" (3), "Placebo model" (2), "No carry-over into self
#' model" (2), "Treatment decay model" (2), "Proportionality model" (1). The
#' number in parentheses is the number of different efficiency factors that can
#' be specified.
#' @param eff.factor Weights for different efficiency factors. (Not used in the
#' moment.)
#' @param v.rep Integer vector specifying how often each treatment should be
#' assigned (sum must equal s*p).
#' @param balance.s Boolean specifying whether to allocate the treatments as
#' equally as possible to each sequence (can result in loss of efficiency).
#' @param balance.p Boolean specifying whether to allocate the treatments as
#' equally as possible to each period (can result in loss of efficiency).
#' @param verbose Level of verbosity, a number between 0 and 10. The default
#' \code{verbose=0} does not print any output, while \code{verbose=10} prints
#' any available notes.
#' @param model.param List of additional model specific parameters. In the
#' moment these are \code{ppp}, the proportionality parameter for the
#' proportionality model, and \code{placebos}, the number of placebo treatments
#' in the placebo model.
#' @param n \code{n=c(n1,n2)} with \var{n1} the number of hill climbing steps
#' per trial and \var{n2} the number of searches from random start matrices.
#' @param jumps To reduze the possibility of the hill-climbing algorithm to get
#' stuck in local extrema long jumps of distance \var{d} can be performed all
#' \var{k} steps. This can be specified as \code{long.jumps=c(d,k)}. If
#' \var{long.jumps} has only length 1 the default for \var{k} is 50.  If after
#' \var{k/2} hill-climbing steps the old design criterion is not enhanced (or
#' at least reached), the algorithm returns to the design from before the jump.
#' @param start.designs List of start designs. If missing or to few start
#' designs are specified (with regard to parameter \var{n} which specifies a
#' number of 20 start designs as default) the start designs are generated
#' randomly with the sample function. Alternatively
#' \code{start.designs="catalog"} can be used to take start designs from the
#' catalog to which random designs are added till \var{n2} start designs are at
#' hand.
#' @param contrast Contrast matrix to be optimised. TODO: Example and better
#' explanation for contrast.
#' @return Returns the design as an integer matrix.
#' @author Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @references John, J. A., Russell, K. G., & Whitaker, D. (2004). CrossOver:
#' an algorithm for the construction of efficient cross-over designs.
#' Statistics in medicine, 23(17), 2645-2658.
#' @keywords misc
#' @examples
#' 
#' x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
#' 
#' result <- searchCrossOverDesign(s=9, p=5, v=4, model=4, eff.factor=1, jumps=c(10000,200), n=c(1000,5))
#' plot(result)
#' 
#' #x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, contrast=)
#' 
#' 
#' @export searchCrossOverDesign
searchCrossOverDesign <- function(s, p, v, model="Standard additive model", eff.factor=1,
                                  v.rep, balance.s=FALSE, balance.p=FALSE, verbose=0, model.param=list(), 
                                  n=c(5000, 20), jumps=c(5, 50), start.designs, contrast) {
  #seed <<- .Random.seed #TODO Do not forget to remove this after testing! :)
  start.time <- proc.time()
  if (length(n)==1) {
    if (missing(start.designs)) { n <- c(n, 20) } else { n <- c(n, length(start.designs)) }
  }
  if (length(jumps)==1) jumps <- c(jumps, 50)
  if (jumps[2]==0) stop("The second component of 'jumps' must be a positive integer.")
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
  if (length(start.designs)!=n[2]) { warning(paste("More start designs specified than number of search runs. Search runs are increased to ", length(start.designs), ".", sep="")) }

  CC <- t(C) %*% C

  if (model==8) { # Second-order carry-over effects
      r <- c(rep(s/v, v), rep((p-1)*s/v^2, v^2), rep((p-2)*s/v^3, v^3))
  } else {
      r <- c(rep(s/v, v), rep((p-1)*s/v^2, v^2))
  }
  S2 <- sum(diag(ginv(t(H) %*% diag(r) %*% H) %*% CC))
  
  result <- .Call( "searchCOD", as.integer(s), as.integer(p), as.integer(v), 
                   start.designs, H, C, model, eff.factor, 
                   v.rep, balance.s, balance.p, verbose, 
                   as.integer(n), as.integer(jumps), S2, TRUE, PACKAGE = "crossover" )
  
  design <- result$design
  
  if (!estimable(design, v=v, model=model, C=C)) {
      stop("Something went wrong. Specified contrasts are not estimable with this design.")
  }  
  time <- proc.time()-start.time
  class(time) <- NULL
  #varTrtPair <- paste(capture.output(print(general.carryover(t(design), model=model))), collapse = "\n")
  #return(list(design=design, varTrtPair=varTrtPair, eff=eff, search=, time=))
  return(new("crossoverSearchResult", design=new("crossoverDesign", design, v=v, model=model, description="Found by search algorithm"), startDesigns=start.designs, eff=result$eff,                   
             search=list(n=n, jumps=jumps), model=model, time=time, misc=list(designs=result$designs)))
}

randomDesign <- function(s, p, v,  v.rep, balance.s=FALSE, balance.p=FALSE, model, C) {
  if (missing(v.rep)) {
    v.rep <- rep((s*p) %/% v, v) + c(rep(1, (s*p) %% v), rep(0, v-((s*p) %% v)))
  }
  design <- randomDesignWithoutCheck(s, p, v,  v.rep, balance.s, balance.p, model)
  i <- 0
  # We should disable the really rare warnings estimable_R could throw.
  while (!estimable_R(design, v, model, C)) {   
    i <- i + 1
    if (i>1000) stop("Could not find design that allows estimation of contrasts after 1000 tries.")
    design <- randomDesignWithoutCheck(s, p, v,  v.rep, balance.s, balance.p, model)
  } 
  return(design)
}

randomDesignWithoutCheck <- function(s, p, v,  v.rep, balance.s=FALSE, balance.p=FALSE, model) {
    if (balance.s) {
        design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:s,p)), sample)), p, s)
    } else if (balance.p) {
        design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:p,s)), sample)), p, s, byrow=TRUE)
    } else {
        design <- matrix(sample(rep(1:v, v.rep)), p, s)
    }
    return(design)
}

estimable_R <- function(design, v, model, C, verbose=0) {
  if(missing(C)) {
    Csub <- contrMat(n=rep(1, v), type="Tukey")
    class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
    C <- appendZeroColumns(Csub, model, v)
  }
  rcDesign <- rcd(design, v=v, model=model)
  Xr <- rcdMatrix(rcDesign, v, model)
  H <- linkMatrix(model, v)
  X <- Xr %*% H
  Z <- getZ(s=dim(design)[2],p=dim(design)[1])
  X <- cbind(X, Z)  
  XX <- t(X) %*% X
  C <- cbind(C, matrix(0, dim(C)[1], dim(Z)[2]))
  if (verbose) {            
      print(rcDesign)
      print(Xr)
      print(abs(C %*% ginv(XX) %*% XX-C))
  }
  return(isTRUE(all.equal(C %*% ginv(XX) %*% XX, C, check.attributes=FALSE, check.names=FALSE))) # Criterion to test whether - see Theorem \ref{thr:estimable} of vignette.
}

estimable <- function(design, v, model, C, verbose=0) {
    if(missing(C)) {
        Csub <- contrMat(n=rep(1, v), type="Tukey")
        class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
        C <- appendZeroColumns(Csub, model, v)
    }
    rcDesign <- rcd(design, v=v, model=model)
    linkM <- linkMatrix(model, v)
    Z <- getZ(s=dim(design)[2],p=dim(design)[1])
    return(.Call( "estimable2R", rcDesign, v, model, linkM, C, Z, verbose, PACKAGE = "crossover" ))    
}

getS1 <- function(design, v, model, C, verbose=0) {
    if(missing(C)) {
        Csub <- contrMat(n=rep(1, v), type="Tukey")
        class(Csub) <- "matrix" #TODO Package matrix can be improved here (IMO)!
        C <- appendZeroColumns(Csub, model, v)
    }
    linkM <- linkMatrix(model, v)
    return(.Call( "getS12R", design, v, model, linkM, C))
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
  rcDesign <- rcd(design, v, model=model)
  Ar <- infMatrix(rcDesign, v)
  H <- linkMatrix(model, v)
  return(diag(ginv(t(H) %*% Ar %*% H) %*% CC))  
}

dput2 <- function(x) {
  paste(capture.output(dput(x)), collapse = " ")
}
