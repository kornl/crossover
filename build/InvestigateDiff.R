design <- t(structure(c(1L, 3L, 2L, 2L, 3L, 3L, 3L, 1L, 1L, 2L, 2L, 1L), .Dim = c(4L, 3L)))
n.subj<-length(design[,1])
n.per<-length(design[1,])
n.dat<-n.subj*n.per
n.trt<-length(table(design))
model<-5

## locate unique sequences
unique.seq<-unique(data.frame(design))
n.seq<-dim(unique.seq)[1]

## count how many subjects per sequence and identify groups subjects belong to
n.per.seq<-rep(0,n.seq)
group.id<-numeric(length=n.dat)
for(i in 1:n.subj){
  for(k in 1:n.seq){
    if(sum(abs(design[i,]-unique.seq[k,]))==0){
      n.per.seq[k]<-n.per.seq[k]+1
      low<-(i-1)*n.per+1
      upp<-low+(n.per-1)
      group.id[low:upp]<-k
    }
  }
}
## create vectors for subjects and periods and treatments
##subject factor
subject<-rep(1:n.subj, rep(n.per,n.subj))
##period factor
per<-rep(1:n.per, n.subj)
## construct X matrices
## columns of Xmat = mean, subjects, periods  - common to all models
##mean column
Xmat.mean<-matrix(1,n.dat,1)
## subject columns
Xmat.subj<-matrix(0,n.dat,n.subj)
for(i in 1:n.dat){
  Xmat.subj[i,subject[i]]<-1
}
## period columns
Xmat.per<-matrix(0,n.dat,n.per)
for(i in 1:n.dat){
  Xmat.per[i,per[i]]<-1
}

## MODEL 5 - TREATMENTS + NO CARRY-OVER INTO SELF
if(model==5){
  ## no carry-over into self
  ## factor for treatments
  trt<-NULL
  for(i in 1:n.subj){
    trt<-c(trt,design[i,])
  }
  ## treatment columns
  Xmat.trt<-matrix(0,n.dat,n.trt)
  for(i in 1:n.dat){
    Xmat.trt[i,trt[i]]<-1
  }
  carry.mat<-matrix(0,n.subj,n.per)
  for(i in 1:n.subj){
    for(j in 2:n.per){
      if(design[i,j]!=design[i,(j-1)]){carry.mat[i,j]<-design[i,(j-1)]}
    }}
  car<-NULL
  for(i in 1:n.subj){
    car<-c(car,carry.mat[i,])
  }
  Xmat.car<-matrix(0,n.dat,n.trt)
  for(i in 1:n.dat){
    if(car[i]>0){Xmat.car[i,car[i]]<-1}
  }
  ## model with mean, subjects, periods, treatments and no carry-over into self
  Xmat<-cbind(Xmat.mean,Xmat.subj,Xmat.per,Xmat.trt,Xmat.car)
  XtX<-t(Xmat)%*%Xmat
  XtX.inv<-ginv(XtX)
  ## pairwise comparisons
  ## treatments
  Var.trt<-XtX.inv[(1+n.subj+n.per+1):(1+n.subj+n.per+n.trt),(1+n.subj+n.per+1):(1+n.subj+n.per+n.trt)]
  Var.trt.pair<-matrix(0,n.trt,n.trt)
  for(i in 1:(n.trt-1)){
    for(j in 1:n.trt){
      Var.trt.pair[i,j]<-Var.trt[i,i]+Var.trt[j,j]-2*Var.trt[i,j]
      Var.trt.pair[j,i]<-Var.trt.pair[i,j]
    }}
  ## carry-overs
  Var.car<-XtX.inv[(1+n.subj+n.per+n.trt+1):(1+n.subj+n.per+n.trt+n.trt),(1+n.subj+n.per+n.trt+1):(1+n.subj+n.per+n.trt+n.trt)]
  Var.car.pair<-matrix(0,n.trt,n.trt)
  for(i in 1:(n.trt-1)){
    for(j in 1:n.trt){
      Var.car.pair[i,j]<-Var.car[i,i]+Var.car[j,j]-2*Var.car[i,j]
      Var.car.pair[j,i]<-Var.car.pair[i,j]
    }}
  return(list(Var.trt.pair=Var.trt.pair,Var.car.pair=Var.car.pair,model=model))
}