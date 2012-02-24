library(crossover)

## simulate design for 7 (placebo + 6 active treatments) in 42 subjects in two periods

## Design: all 42 pairs, 12,13,14,15,16,17; 
##                       21,23,24,25,26,27;
##                       31,32,34,35,36,37;
##                       41,42,43,45,46,47;
##                       51,52,53,54,56,57;
##                       61,62,63,64,65,67;
##                       71,72,73,74,75,76.

nseq<-42
nper<-2
ntrt<-7
n<-rep(1,nseq)
design<-matrix(c(1,2,1,3,1,4,1,5,1,6,1,7,                       
				2,1,2,3,2,4,2,5,2,6,2,7,
				3,1,3,2,3,4,3,5,3,6,3,7,
				4,1,4,2,4,3,4,5,4,6,4,7,
				5,1,5,2,5,3,5,4,5,6,5,7,
				6,1,6,2,6,3,6,4,6,5,6,7,
				7,1,7,2,7,3,7,4,7,5,7,6),nseq,nper,byrow=T)

design.out<-design.efficiency(design,nseq,ntrt,nper,n)

########################################################################
## end of efficiency calculations                                     ##
########################################################################


xmat.no.subjects<-design.out$xmat.no.subjects
var.trt.pair<-design.out$var.trt.pair
eff.trt.pair<-design.out$eff.trt.pair
av.eff.trt.pair<-design.out$av.eff.trt.pair
var.trt.pair.adj<-design.out$var.trt.pair.adj
eff.trt.pair.adj<-design.out$eff.trt.pair.adj
av.eff.trt.pair.adj<-design.out$av.eff.trt.pair.adj

print(av.eff.trt.pair.adj)

