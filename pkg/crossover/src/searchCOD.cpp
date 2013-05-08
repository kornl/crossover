#include "search.h"

SEXP searchCOD(SEXP sS, SEXP pS, SEXP vS, SEXP designS, SEXP linkMS, SEXP tCCS, SEXP modelS, SEXP effFactorS, SEXP vRepS, SEXP balanceSS, SEXP balancePS, SEXP verboseS) {
                 
  using namespace arma;
  using namespace Rcpp;
  
  BEGIN_RCPP // Rcpp defines the BEGIN_RCPP and END_RCPP macros that should be used to bracket code that might throw C++ exceptions.
  
  bool verbose = is_true( any( LogicalVector(verboseS) ) );
  bool balanceS = is_true( any( LogicalVector(balanceS) ) );
  bool balanceP = is_true( any( LogicalVector(balanceP) ) );
  int s = IntegerVector(sS)[0];
  int p = IntegerVector(sS)[0];
  int v = IntegerVector(sS)[0];
  vec vRep = as<vec>(vRepS);
  mat design = as<mat>(designS);
  mat linkM = as<mat>(linkMS);
  mat tCC = as<mat>(tCCS); // t(C) %*% C
  
  //TODO Just an example error - these things should be done in R - but perhaps I need this code later.
  //if (s < 1) error("arg s was %d, must be positive\n", s);  
  
  // TODO Read random number generators and C!
  GetRNGstate();
  int i = ceil(runif(1)*p)[0];
  PutRNGstate();
  //NumericVector ij = ceiling(runif(4)*c(p,s,p,s))   
  
  if (verbose) Rprintf("Starting search algorithm!\n");
  
  for(int i=0; i<1000; i++) {
  	//s[i] = 0;
	}
  //double ip = as_scalar(v.t() * v);
  return List::create(Named("v.rep")=vRep, Named("v.rep2")=vRep);
  
  END_RCPP
}