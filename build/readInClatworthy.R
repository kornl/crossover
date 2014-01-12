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
  assign(designName, t)
  
  con <- textConnection(data[c(2)])    
  meta <- as.matrix(read.table(con, header = FALSE))[1,]
  if (meta[1]!=v) cat("v differs for",designName,": ", meta[1], v, "\n")
  if (meta[2]!=s) cat("s differs for",designName,": ", meta[2], s, "\n")
  if (meta[3]!=p) cat("ü differs for",designName,": ", meta[3], p, "\n")
}




davisHall6ta <- t


save(davisHall6ta, davisHall6tb, davisHall6tc, davisHall7ta, davisHall7tb, davisHall7tc, davisHall8ta, davisHall8tb, davisHall8tc, davisHall9ta, davisHall9tb, davisHall9tc, file="davisHall.rda")

