
## test designs

## no carry-over
design<-matrix(  
		c(
				5,6,6,4,1,2,4,3,7,2,7,5,3,1,
				6,3,7,6,4,7,3,1,5,5,2,1,4,2,
				7,1,3,2,6,4,5,4,1,3,5,2,7,6,
				4,7,1,3,5,1,7,5,2,6,6,3,2,4),ncol=4,byrow=FALSE)
model<-0
design.out<-general.carryover(design,model)

## first-order carry-over
design<-matrix(  
		c(
				5,2,3,1,7,1,4,4,5,3,6,6,7,2,
				4,3,4,6,6,7,5,1,3,2,2,7,1,5,
				2,6,7,4,3,3,6,5,7,4,1,5,2,1,
				7,5,2,3,1,5,1,7,4,6,4,2,6,3),ncol=4,byrow=FALSE)
model<-1
design.out<-general.carryover(design,model)

## self-adjacency carry-overs
design<-matrix(  
		c(
				3,4,4,6,6,2,5,7,5,1,7,1,2,4,
				5,4,3,7,1,1,5,7,2,6,3,2,6,7,
				6,5,1,4,3,7,4,1,7,2,6,5,3,2,
				6,7,5,1,4,5,2,1,6,2,4,3,3,3),ncol=4,byrow=FALSE)
model<-2
design.out<-general.carryover(design,model)

## proportional carry-over
design<-matrix(  
		c(
				7,1,7,1,6,3,6,5,4,5,4,2,3,2,
				3,2,1,6,7,5,3,4,7,6,1,5,2,4,
				5,4,2,5,1,6,7,2,3,4,7,3,1,6,
				5,4,2,5,1,6,7,2,3,4,7,3,1,6),ncol=4,byrow=FALSE)
model<-3 
rho<-0.5
design.out<-general.carryover(design,model,rho=rho)

## one placebo carry-over
design<-matrix(  
		c(
				4,6,5,2,3,1,7,4,3,6,1,2,5,7,
				2,1,7,4,1,4,2,5,5,7,6,3,3,6,
				1,7,1,7,2,3,5,6,2,4,5,6,4,3,
				5,5,3,3,6,7,1,2,7,1,4,4,6,2),ncol=4,byrow=FALSE)
model<-4
t0<-1
design.out<-general.carryover(design,model,t0=t0)

## no carry-over into self
design<-matrix(  
		c(
				2,7,1,3,4,6,5,3,5,4,7,2,6,1,
				5,4,6,2,2,3,1,1,7,7,3,6,2,5,
				6,5,5,7,3,7,4,2,2,6,4,4,1,3,
				7,2,4,7,5,5,3,4,1,1,6,1,3,6),ncol=4,byrow=FALSE)
model<-5
design.out<-general.carryover(design,model)

## treatment decay
design<-matrix(  
		c(
				1,5,5,7,7,1,2,6,2,4,4,6,3,3,
				7,3,2,2,5,6,5,4,4,3,7,1,6,1,
				2,2,6,6,4,3,7,1,3,1,5,4,7,5,
				2,4,6,3,4,5,1,1,3,7,6,2,7,5),ncol=4,byrow=FALSE)
model<-6
design.out<-general.carryover(design,model)

## first- and second-order carry-overs
design<-matrix(  
		c(
				1,2,7,4,6,3,6,5,2,5,1,3,2,4,
				3,6,1,2,3,7,5,6,4,3,4,5,7,1,
				4,4,2,5,1,5,2,7,1,6,7,4,3,6,
				6,5,2,5,7,7,3,7,1,1,2,4,3,6),ncol=4,byrow=FALSE)
model<-8
design.out<-general.carryover(design,model)

## IF SIMULATED DATA REQUIRED AS AN OUTPUT FROM FUNCTION THEN NEED TO SET UP 
## PARAMETER VALUES
## ONLY ONE SIMULATED DATASET IS RETURNED
## SEED IS SET BY CLOCK

## Example: simulated data required for design with 5 periods, 5 treatments and 10 groups
## set the value of the within-patient variance (and standard deviation)                                    
sigw2<-1440                                                                                                 
## standard deviation                                                                                       
sigw<-sqrt(sigw2)                                                                                           
## within-subject correlation between repeated measurements                                                 
rho<-0.6                                                                                                    
## convert this into a value for the between-patient variance (and between-patient standard deviation)      
sigs2<-(rho/(1-rho))*sigw2                                                                                  
sigs<-sqrt(sigs2)                                                                                           
## set values for the model parameters                                                                 
## overall mean                                                                                             
gmean<-80  
nper<-5
ntrt<-5
ngrp<-10                                                                                                 
## period means                                                                                             
per.val<-c(0,2,4,6,8) 
## treatment means                                                                                             
trt.val<-c(0,5,10,15,20)                                                                                                                                                                                
## set carry-over effect means                                     
lambda.val<-rep(0,ntrt)                                                                                        
## set group means (should be zero, but can be set to see effect of simulating non-zero means)              
group.val<-rep(0,ngrp)
par.val<-c(sigw,sigs,gmean,group.val,per.val,trt.val,lambda.val)   
## design that optimizes trt*car interaction 
design<-matrix(  
		c(
				1,2,3,3,4,5,4,2,1,5,
				5,3,5,4,3,4,2,1,2,2,
				2,5,4,4,3,4,1,1,5,3,
				4,1,1,5,2,2,1,5,3,3,
				3,4,2,1,5,2,3,5,4,1
		),ncol=5,byrow=FALSE) 
model<-7
sim<-1
design.out<-general.carryover(design,model,sim=sim,parm.val=parm.val)

## simulated data required for design with 4 periods, 7 treatments and 14 groups
## set the value of the within-patient variance (and standard deviation)  
## set values for the model parameters                                                                 
## overall mean                                                                                             
gmean<-80  
nper<-4
ntrt<-7
ngrp<-14                                                                                                 
## period means                                                                                             
per.val<-c(0,2,4,6) 
## treatment means                                                                                             
trt.val<-c(0,5,10,15,20,25,30)                                                                                                                                                                                
## set carry-over effect means 
lambda.val<-rep(0,ntrt)                                                                                        
## set group means (should be zero, but can be set to see effect of simulating non-zero means)              
group.val<-rep(0,ngrp)
par.val<-c(sigw,sigs,gmean,group.val,per.val,trt.val,lambda.val)
## design optimizes treatments + first-order carry-over
design<-matrix(  
		c(
				5,2,3,1,7,1,4,4,5,3,6,6,7,2,
				4,3,4,6,6,7,5,1,3,2,2,7,1,5,
				2,6,7,4,3,3,6,5,7,4,1,5,2,1,
				7,5,2,3,1,5,1,7,4,6,4,2,6,3),ncol=4,byrow=FALSE)
model<-7
sim<-1
design.out<-general.carryover(design,model,sim=sim,parm.val=parm.val)
