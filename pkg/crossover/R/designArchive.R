getStartDesigns <- function(s,p,v) {
  objects <- ls(envir=crossover:::crossover.env)
  candidates <- list()
  for (x in objects) {
    x <- get(x, envir=crossover:::crossover.env)
    if (!is.matrix(x)) next
    if (!all(dim(x)==c(p,v))) next
    if (length(levels(as.factor(x)))!=v) next
    candidates <- c(candidates, x)
  }
  return(candidates)
}