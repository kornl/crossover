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
  
  // TODO Read random number generators and C!
  GetRNGstate();
  
  if (verbose) Rprintf("Starting search algorithm!\n");
  mat designOld, rcDesign, Ar;
  double eOld = 0;
  double varOld = 10000000; // TODO Make this look less arbitrary. :) - It's really okay for all reasonable cases.
  double s1, s2;
  NumericVector rows, cols;
  for(int i=0; i<1000; i++) {  
    designOld = design;
    rows = ceil(runif(2)*s); 
    cols = ceil(runif(2)*p);  
    while ( design[rows[0],cols[0]] == design[rows[1],cols[1]] ) {
      rows = ceil(runif(2)*s); 
      cols = ceil(runif(2)*p);  
    }
    double tmp = design[rows[0],cols[0]];
    design[rows[0],cols[0]] = design[rows[1],cols[1]];
    design[rows[1],cols[1]] = tmp;
    rcDesign = createRowColumnDesign(design);
    Ar = getInfMatrixOfDesign(rcDesign, v+v*v);
    
    s2 = 1; // We set this constant for the moment
    s1 = trace(pinv(trans(linkM) * Ar * linkM) * tCC) ;
    
    //if (verbose) Rprintf(S2/S1, " vs. ", eOld, " ");
    if (s2/s1 > eOld) {
      if (verbose) Rprintf("=> Accepting new matrix.\n");
      eOld = s2/s1; 
    } else {
      if (verbose) Rprintf("=> Keeping old matrix.\n");
      design = designOld;    
    }
  }
  PutRNGstate();
  //double ip = as_scalar(v.t() * v);
  return List::create(Named("design")=design, Named("eff")=s2/s1);
  
  END_RCPP
}

arma::mat createRowColumnDesign(arma::mat design) {
  return design;
}

arma::mat getInfMatrixOfDesign(arma::mat rcDesign, int v) {
  return rcDesign; 
}