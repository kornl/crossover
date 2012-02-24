library(crossover)
library(RUnit)

for (file in dir(path ="pkg/crossover/R")) {
  source(paste("pkg/crossover/R",file,sep="/"))
}



