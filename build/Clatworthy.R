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