################################################################################################
##           FUNCTION                                                     ######################
################################################################################################



#' Search for a Cross-Over Design
#' 
#' Search for a Cross-Over Design
#' 
#' See the vignette of this package for further details.
#' 
#' @param design Cross-over design.
#' @param model Model - one of the following numbers or Strings: 1 = "Standard
#' additive model", 2 = "Self-adjacency model", 3 = "Proportionality model", 4
#' = "Placebo model", 5 = "No carry-over into self model", 6 = "Treatment decay
#' model", 7 = "Full set of interactions", 8 = "Second-order carry-over
#' effects"
#' @param t0 The number of placebo treatments in the placebo model.
#' @param rho The proportionality parameter for the proportionality model.
#' @return TODO ...
#' @author Byron Jones
#' @references Jones, B., & Kenward, M. G. (2003). Design and analysis of
#' cross-over trials (Vol. 98). Chapman & Hall.
#' @keywords misc
#' @examples
#' 
#' x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, eff.factor=1)
#' 
#' @export general.carryover
general.carryover<-function(design,model,t0=1,rho=0.5){  
  if (class(design)=="crossoverSearchResult") {
      if(missing(model)) model <- design@model
      design <- design@design      
  }
  if (class(design)=="crossoverDesign") {
    model <- design@model
    design <- design@design
  }
  model <- getModelNr(model)
  design <- t(design)
  
	## set the design parameters
	n.subj<-length(design[,1])
	n.per<-length(design[1,])
	n.dat<-n.subj*n.per
	n.trt<-length(table(design))
	
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
	
	## MODEL 0 - TREATMENTS ONLY
	if(model==0){
		## treatments only model
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
		## model with mean, subjects, periods, treatments
		Xmat<-cbind(Xmat.mean,Xmat.subj,Xmat.per,Xmat.trt)
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
		return(list(Var.trt.pair=Var.trt.pair,model=model))
	}
	
	## MODEL 1 - TREATMENTS + FIRST-ORDER ADDITIVE CARRY-OVERS
	if(model==1){
		## additive carry-overs model
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
		## additive first carry-over factor
		car<-NULL
		for(i in 1:n.subj){
			car<-c(car,1,design[i,1:(n.per-1)])
		}
		## additive carry-over columns
		Xmat.car<-matrix(0,n.dat,n.trt)
		for(i in 1:n.dat){
			if(car[i]>0){Xmat.car[i,car[i]]<-1}
		}
		## model with mean, subjects, periods, treatments and additive carry-overs
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
			}
		}
		## carry-overs
		Var.car<-XtX.inv[(1+n.subj+n.per+n.trt+1):(1+n.subj+n.per+n.trt+n.trt),(1+n.subj+n.per+n.trt+1):(1+n.subj+n.per+n.trt+n.trt)]
		Var.car.pair<-matrix(0,n.trt,n.trt)
		for(i in 1:(n.trt-1)){
			for(j in 1:n.trt){
				Var.car.pair[i,j]<-Var.car[i,i]+Var.car[j,j]-2*Var.car[i,j]
				Var.car.pair[j,i]<-Var.car.pair[i,j]
			}
		}
		return(list(Var.trt.pair=Var.trt.pair,Var.car.pair=Var.car.pair,model=model))
	}
	
	## MODEL 2 - TREATMENTS + SELF ADJACENT CARRY-OVERS [ TWO TYPES OF CARRY-OVER ]
	if(model==2){
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
		## carry-over after a different previous treatment 
		carry.mat.1<-matrix(0,n.subj,n.per)
		for(i in 1:n.subj){
			for(j in 2:n.per){
				if(design[i,j]!=design[i,(j-1)]){carry.mat.1[i,j]<-design[i,(j-1)]}
			}}
		car.1<-NULL
		for(i in 1:n.subj){
			car.1<-c(car.1,carry.mat.1[i,])
		}
		Xmat.car.1<-matrix(0,n.dat,n.trt)
		for(i in 1:n.dat){
			if(car.1[i]>0){Xmat.car.1[i,car.1[i]]<-1}
		}
		## carry-over after same previous treatment 
		carry.mat.2<-matrix(0,n.subj,n.per)
		for(i in 1:n.subj){
			for(j in 2:n.per){
				if(design[i,j]==design[i,(j-1)]){carry.mat.2[i,j]<-design[i,(j-1)]}
			}}
		car.2<-NULL
		for(i in 1:n.subj){
			car.2<-c(car.2,carry.mat.2[i,])
		}
		Xmat.car.2<-matrix(0,n.dat,n.trt)
		for(i in 1:n.dat){
			if(car.2[i]>0){Xmat.car.2[i,car.2[i]]<-1}
		}
		## model with mean, subjects, periods, treatments and the two types of carry-over
		Xmat<-cbind(Xmat.mean,Xmat.subj,Xmat.per,Xmat.trt,Xmat.car.1,Xmat.car.2)
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
		Var.car.1<-XtX.inv[(1+n.subj+n.per+n.trt+1):(1+n.subj+n.per+n.trt+n.trt),(1+n.subj+n.per+n.trt+1):(1+n.subj+n.per+n.trt+n.trt)]
		Var.car.pair.1<-matrix(0,n.trt,n.trt)
		for(i in 1:(n.trt-1)){
			for(j in 1:n.trt){
				Var.car.pair.1[i,j]<-Var.car.1[i,i]+Var.car.1[j,j]-2*Var.car.1[i,j]
				Var.car.pair.1[j,i]<-Var.car.pair.1[i,j]
			}}
		## carry-overs
		Var.car.2<-XtX.inv[(1+n.subj+n.per+n.trt+n.trt+1):(1+n.subj+n.per+n.trt+n.trt+n.trt),(1+n.subj+n.per+n.trt+n.trt+1):(1+n.subj+n.per+n.trt+n.trt+n.trt)]
		Var.car.pair.2<-matrix(0,n.trt,n.trt)
		for(i in 1:(n.trt-1)){
			for(j in 1:n.trt){
				Var.car.pair.2[i,j]<-Var.car.2[i,i]+Var.car.2[j,j]-2*Var.car.2[i,j]
				Var.car.pair.2[j,i]<-Var.car.pair.2[i,j]
			}}
		return(list(Var.trt.pair=Var.trt.pair,Var.car.pair.1=Var.car.pair.1,Var.car.pair.2=Var.car.pair.2,model=model))
	}
	
	## MODEL 3 - TREATMENTS + PROPORTION OF PREVIOUS TREATMENT EFFECT - proportion = rho
	if(model==3){
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
		## identify carry-over effects
		car<-NULL
		for(i in 1:n.subj){
			car<-c(car,0,design[i,1:(n.per-1)])
		}
		## add carry-over as proportion of previous treatment effect
		Xmat.car<-matrix(0,n.dat,n.trt)
		for(i in 1:n.dat){
			if(car[i]>0){Xmat.car[i,car[i]]<-rho}
		}
		Xmat.trt<-Xmat.trt+Xmat.car
		## model with mean, subjects, periods, treatments 
		Xmat<-cbind(Xmat.mean,Xmat.subj,Xmat.per,Xmat.trt)
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
		return(list(Var.trt.pair=Var.trt.pair,model=model,rho=rho))
	}
	
	## MODEL 4 - ACTIVE TREATMENTS + PLACEBO TREATMENTS (FIRST t0 TREATMENTS) - NO CARRY-OVER AFTER ANY PLACEBO
	if(model==4){
		## no carry-over after placebo treatments
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
				if(design[i,(j-1)]>t0){carry.mat[i,j]<-design[i,(j-1)]}
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
		return(list(Var.trt.pair=Var.trt.pair,Var.car.pair=Var.car.pair,model=model,t0=t0))
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
	
	## MODEL 6 - CARRY-OVER = TREATMENT DECAY
	if(model==6){
		## treatment decay
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
				if(design[i,j]==design[i,(j-1)]){carry.mat[i,j]<-design[i,(j-1)]}
			}}
		car<-NULL
		for(i in 1:n.subj){
			car<-c(car,carry.mat[i,])
		}
		Xmat.car<-matrix(0,n.dat,n.trt)
		for(i in 1:n.dat){
			if(car[i]>0){Xmat.car[i,car[i]]<--1}
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
	
	## MODEL 7 - TREATMENT x CARRY-OVER INTERACTION
	## ****************************************##
	## NOT SURE IF THIS GIVES CORRECT RESULTS - MORE CHECKING NEEDED ##
	## **************************************************************##
	if(model==7){
		## treatments only model
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
		## additive first carry-over factor
		## additive first carry-over factor
		car<-NULL
		for(i in 1:n.subj){
			car<-c(car,1,design[i,1:(n.per-1)])
		}
		## additive carry-over columns
		Xmat.car<-matrix(0,n.dat,n.trt)
		for(i in 1:n.dat){
			if(car[i]>0){Xmat.car[i,car[i]]<-1}
		}
		## treatment x carry-over interaction columns
		Xmat.int<-matrix(0,n.dat,n.trt*n.trt)
		count<-0
		for(i in 1:n.trt){
			for(j in 1:n.trt){
				count<-count+1
				Xmat.int[,count]<-Xmat.trt[,i]*Xmat.car[,j]
			}
		}
		## model with mean, subjects, periods, treatments and interaction
		Xmat<-cbind(Xmat.mean,Xmat.subj,Xmat.per,Xmat.trt,Xmat.car,Xmat.int)
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
		return(list(Var.trt.pair=Var.trt.pair,model=model))
	}
	
	## MODEL 8 - TREATMENTS + FIRST-ORDER ADDITIVE CARRY-OVERS + SECOND-ORDER ADDITIVE CARRY-OVERS
	if(model==8){
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
		## additive first-order carry-over factor
		car.1<-NULL
		for(i in 1:n.subj){
			car.1<-c(car.1,1,design[i,1:(n.per-1)])
		}
		## additive carry-over columns
		Xmat.car.1<-matrix(0,n.dat,n.trt)
		for(i in 1:n.dat){
			if(car.1[i]>0){Xmat.car.1[i,car.1[i]]<-1}
		}
		## additive second-order carry-over factor
		car.2<-NULL
		for(i in 1:n.subj){
			car.2<-c(car.2,1,1,design[i,1:(n.per-2)])
		}
		## additive carry-over columns
		Xmat.car.2<-matrix(0,n.dat,n.trt)
		for(i in 1:n.dat){
			if(car.2[i]>0){Xmat.car.2[i,car.2[i]]<-1}
		}
		## model with mean, subjects, periods, treatments and additive carry-overs
		Xmat<-cbind(Xmat.mean,Xmat.subj,Xmat.per,Xmat.trt,Xmat.car.1,Xmat.car.2)
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
		Var.car.1<-XtX.inv[(1+n.subj+n.per+n.trt+1):(1+n.subj+n.per+n.trt+n.trt),(1+n.subj+n.per+n.trt+1):(1+n.subj+n.per+n.trt+n.trt)]
		Var.car.pair.1<-matrix(0,n.trt,n.trt)
		for(i in 1:(n.trt-1)){
			for(j in 1:n.trt){
				Var.car.pair.1[i,j]<-Var.car.1[i,i]+Var.car.1[j,j]-2*Var.car.1[i,j]
				Var.car.pair.1[j,i]<-Var.car.pair.1[i,j]
			}}
		## carry-overs
		Var.car.2<-XtX.inv[(1+n.subj+n.per+n.trt+n.trt+1):(1+n.subj+n.per+n.trt+n.trt+n.trt),(1+n.subj+n.per+n.trt+n.trt+1):(1+n.subj+n.per+n.trt+n.trt+n.trt)]
		Var.car.pair.2<-matrix(0,n.trt,n.trt)
		for(i in 1:(n.trt-1)){
			for(j in 1:n.trt){
				Var.car.pair.2[i,j]<-Var.car.2[i,i]+Var.car.2[j,j]-2*Var.car.2[i,j]
				Var.car.pair.2[j,i]<-Var.car.pair.2[i,j]
			}}
		return(list(Var.trt.pair=Var.trt.pair,Var.car.pair.1=Var.car.pair.1,Var.car.pair.2=Var.car.pair.2,model=model))
	}
}

####################################################################################################################
