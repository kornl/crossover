
if (model==1) { // "Standard additive model"
                mat rcDesign = design;
                for (unsigned i=1; i<rcDesign.n_rows; i++) {
                  rcDesign.row(i) = design.row(i)+design.row(i-1)*v;
                }
                return rcDesign;
} else if (model==2) { // "Self-adjacency model"
                       
} else if (model==3) { // "Proportionality model"
                       
} else if (model==4) { // "Placebo model"
                       return(createRowColumnDesign(design, v, model)) // if we drop the 0 column, we have to revisit this.
} else if (model==5) { // "No carry-over into self model" 
                       
} else if (model==6) { // "Treatment decay model"
                       
} else if (model==7) { // "Full set of interactions"
                       
} else 
  
  
  
  M <- diag(3)
if (!is.numeric(X) || max(X)!=v) { #TODO Check where I need these checks really and where they are still missing.
  X <- matrix(as.numeric(as.factor(X)), dim(X)[1])  
}
if(model=="Standard additive model" || model==1) {
  return( X + v*rbind(0, X[-dim(X)[1],]) )
}
if(model=="Second-order carry-over effects" || model==8) {
  return( X + v*rbind(0, X[-dim(X)[1],]) + v*v*rbind(0, 0, X[c(-(dim(X)[1]-1),-dim(X)[1]),]) )
}
if(model=="Full set of interactions" || model==7) {
  return(M)
}
if(model=="Self-adjacency model" || model==2) {
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
  M[1:v,1:v] <- diag(j)
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