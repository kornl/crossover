path <- system.file("data", package="Crossover")
for (file in dir(path=path)) {		 
  designs <- load(paste(path, file, sep="/"))
  for (designS in designs) {
    design <- get(designS)
    p <- dim(design)[1]
    s <- dim(design)[2]
    v <- length(levels(as.factor(design)))			
    if(!Crossover:::estimable(design, v, 1)) {
      cat(designS, " is not estimable!\n")
    }
  }
}

path <- system.file("data", package="Crossover")
balancedDesigns1 <- c()
balancedDesigns2 <- c()
for (file in dir(path=path)) {  	 
  designs <- load(paste(path, file, sep="/"))
  for (designS in designs) {
    design <- get(designS)
    p <- dim(design)[1]
    s <- dim(design)[2]
    v <- length(levels(as.factor(design)))			
    variances <- general.carryover(design, model=1)$Var.trt.pair[upper.tri(diag(v))]
    if(isTRUE(all.equal(min(variances), max(variances)))) {
      balancedDesigns1 <- c(balancedDesigns1, designS)
      cat(designS, " is balanced!\n")
    }
    if (max(variances)-min(variances)<0.001 && !isTRUE(all.equal(min(variances), max(variances)))) {
      balancedDesigns2 <- c(balancedDesigns2, designS)
      cat(designS, " is nearly balanced (", max(variances)-min(variances) ,")!\n")
    }
  }
}

