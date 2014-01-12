
##DESIGN R94
designPB=matrix(c(
1, 2, 4, 6,
2, 3, 5, 1,
3, 4, 6, 2,
4, 5, 1, 3,
5, 6, 2, 4,
6, 1, 3, 5),ncol=4,byrow=TRUE)

## Williams design
designB=matrix(c(
1, 2, 3, 4,
2, 3, 4, 1,
4, 1, 2, 3,
3, 4, 1, 2),ncol=4,byrow=FALSE)

## construct cross-over design
## replace treatments in designB with those in 
## each row of designPB

nrowPB=dim(designPB)[1]
ncolPB=dim(designPB)[2]
ntrtPB=max(designPB)

nrowB=dim(designB)[1]
ncolB=dim(designB)[2]
ntrtB=max(designB)


xodesign=NULL
for(i in 1:nrowPB){
new.trts=designPB[i,1:ncolPB]
temp=designB
for(j in 1:nrowB){
for(k in 1:ncolB){
for(m in 1:ntrt){
if(designB[j,k]==m){temp[j,k]=designPB[i,m]}
}
}
}
xodesign=rbind(xodesign,temp)
}

xodesign

#######################################################################################
## design constructed by combining PB design R94 with Williams design for 4 treatments
#######################################################################################

## Reference: Clatworthy, W.H. (1973). Tables of Two-Associate-Class Partially Balanced Designs.
## National Bureau of Standards, Applied Mathematics Series 63. U.S. Department of Commerce.

##Partially balanced design p = 4, n = 24, t = 6
PB2.94=matrix(c(
1,2,4,6, 2,3,5,1, 3,4,6,2, 4,5,1,3, 5,6,2,4, 6,1,3,5,
2,4,6,1, 3,5,1,2, 4,6,2,3, 5,1,3,4, 6,2,4,5, 1,3,5,6,
6,1,2,4, 1,2,3,5, 2,3,4,6, 3,4,5,1, 4,5,6,2, 5,6,1,3,
4,6,1,2, 5,1,2,3, 6,2,3,4, 1,3,4,5, 2,4,5,6, 3,5,6,1),ncol=4,byrow=FALSE)



design=PB2.94

## no carry-over
out.0=cross.over.efficiency(design,model=0)
print(round(100*out.0$eff.trt.pair,2))

## with first-order carry-over effects in model
out.1=cross.over.efficiency(design,model=1)
print(round(100*out.1$eff.trt.pair,2))




