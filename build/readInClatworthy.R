setwd("~/git/crossover/build/Clatworthy Designs cleaned/RS")

for (f in dir()) {
  data <- readLines(f)
  con <- textConnection(paste(data[c(-1,-2)], collapse="\n"))  
  t <- as.matrix(read.table(con, header = FALSE))
  rownames(t) <- colnames(t) <- NULL
}

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Clatworthy, W.H. (1973). Tables of Two-Associate-Class Partially Balanced Designs. National Bureau of Standards, Applied Mathematics Series 63. U.S. Department of Commerce."
attr(t, "signature") <- "p = 3, n = 12, t = 6"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN SIX TREATMENTS A"
davisHall6ta <- t


save(davisHall6ta, davisHall6tb, davisHall6tc, davisHall7ta, davisHall7tb, davisHall7tc, davisHall8ta, davisHall8tb, davisHall8tc, davisHall9ta, davisHall9tb, davisHall9tc, file="davisHall.rda")

