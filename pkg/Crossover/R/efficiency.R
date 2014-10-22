
getCounts <- function(design, long=FALSE, omit.balanced=TRUE) {
  s <- summary(as.factor(design))
  if (length(unique(s))==1) return("")
  if (long) return(paste(paste(names(s), " (", s,")", sep=""), collapse=", "))
  return(paste(s, collapse=", "))
}

#' Create the design matrix, variance-covariance matrix, the variance of each
#' pairwise comparison and the efficicency of each pairwise comparison for a
#' cross-over design
#' 
#' Function to read in a cross-over design and create the design matrix X, the
#' variance-covariance matrix of the parameter estimates (X'X)^-1, the variance
#' of each pairwise comparison and the efficicency of each pairwise comparison.
#' 
#' See the vignette of this package for further details.
#' 
#' @param design Cross-over design.
#' @return list(xmat.no.subjects=xmat.no.subjects,
#' var.trt.pair=var.trt.pair,eff.trt.pair=eff.trt.pair,av.eff.trt.pair=av.eff.trt.pair,
#' var.trt.pair.adj=var.trt.pair.adj,eff.trt.pair.adj=eff.trt.pair.adj,av.eff.trt.pair.adj=av.eff.trt.pair.adj)
#' @author Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @references Jones, B., & Kenward, M. G. (2003). Design and analysis of
#' cross-over trials (Vol. 98). Chapman & Hall.
#' @keywords misc
#' @examples
#' 
#' data(fletcher)
#' design.efficiency(fletcher1)
#' 
#' @export design.efficiency
design.efficiency <- function(design, model=1) {
  p <- dim(design)[1]
  s <- dim(design)[2]
  v <- length(levels(as.factor(design)))
  m <- matrix(0, v, v)
  #variances <- 1:(t*(t-1)/2)
  variances <- Crossover:::getValues(design, model, v=v)
  m[lower.tri(m)] <- variances
  m[upper.tri(m)] <- t(m)[upper.tri(m)]
  # Ideal design
  #variancesI <- Crossover:::getValues(design, model="No carry-over effects", v=v)
  im <- matrix(0, v, v)
  #im[lower.tri(im)] <- variancesI
  #im[upper.tri(im)] <- t(im)[upper.tri(im)]  
  #if (abs(variancesI[1]-(v*2)/(p*s))>0.001) cat("getValues differs from simple formula (",variancesI[1],",",(v*2)/(p*s),").\n")
  vn <- sapply(1:v, function(x) {sum(design==x)})
  for (i in 1:v) {
    for (j in 1:v) {
      if (i!=j) {
        im[i, j] <- 1/vn[i]+1/vn[j]
      }
    }
  }
  # Efficiency:
  em <- im/m
  diag(em) <- 0
  return(list(var.trt.pair.adj=m, eff.trt.pair.adj=em))
}