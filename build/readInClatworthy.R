setwd("~/git/crossover/build/Clatworthy Designs cleaned/RS")

for (f in dir()) {
  data <- readLines(f)
  con <- textConnection(paste(data[c(-1,-2)], collapse="\n"))  
  t <- as.matrix(read.table(con, header = FALSE))  
  rownames(t) <- colnames(t) <- NULL
  attr(t, "reference") <- "Clatworthy, W.H. (1973). Tables of Two-Associate-Class Partially Balanced Designs. National Bureau of Standards, Applied Mathematics Series 63. U.S. Department of Commerce."
  attr(t, "title") <- paste("CLATWORTHY",gsub(".DAT","", f))  
  v <- length(levels(as.factor(t)))
  s <- dim(t)[1]
  p <- dim(t)[2]
  attr(t, "signature") <- paste("p = ",p,", n = ",s,", t = ",v,sep="")
  designName <- tolower(make.names(paste("CLATWORTHY",gsub(".DAT","", f))))
  assign(designName, t(t))
  
  con <- textConnection(data[c(2)])    
  meta <- as.matrix(read.table(con, header = FALSE))[1,]
  if (meta[1]!=v) cat("v differs for",designName,": ", meta[1], v, "\n")
  if (meta[2]!=s) cat("s differs for",designName,": ", meta[2], s, "\n")
  if (meta[3]!=p) cat("p differs for",designName,": ", meta[3], p, "\n")
}

save(list=ls(pattern="clatworthy*"), file="../clatworthy1.rda")

t <- t(matrix(c(
  1,2,4,6, 2,3,5,1, 3,4,6,2, 4,5,1,3, 5,6,2,4, 6,1,3,5,
  2,4,6,1, 3,5,1,2, 4,6,2,3, 5,1,3,4, 6,2,4,5, 1,3,5,6,
  6,1,2,4, 1,2,3,5, 2,3,4,6, 3,4,5,1, 4,5,6,2, 5,6,1,3,
  4,6,1,2, 5,1,2,3, 6,2,3,4, 1,3,4,5, 2,4,5,6, 3,5,6,1),ncol=4,byrow=FALSE))

rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Clatworthy, W.H. (1973). Tables of Two-Associate-Class Partially Balanced Designs. National Bureau of Standards, Applied Mathematics Series 63. U.S. Department of Commerce."
attr(t, "signature") <- "p = 4, n = 24, t = 6"
attr(t, "title") <- "PB2.94"
pb2.64 <- t

save(list=ls(pattern="pb2*"), file="../clatworthyC.rda")
