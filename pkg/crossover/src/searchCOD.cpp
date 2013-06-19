#include "searchCOD.h"

using namespace arma;
using namespace Rcpp;

/*
    CharacterVector x = CharacterVector::create( "foo", "bar" )  ;
    NumericVector y   = NumericVector::create( 0.0, 1.0 ) ;
    List z            = List::create( x, y ) ;
  //Environment base("package:base");
  //Function sample = base["sample"];
*/

/*IntegerVector csample_integer( IntegerVector x, int size, bool replace, 
  		       NumericVector prob = NumericVector::create()) {
    RNGScope scope;
    IntegerVector ret = Rcpp::RcppArmadillo::sample(x, size, replace, prob);
    return ret;
} */

SEXP searchCOD(SEXP sS, SEXP pS, SEXP vS, SEXP designS, SEXP linkMS, SEXP tCCS, SEXP modelS, SEXP effFactorS, SEXP vRepS, SEXP balanceSS, SEXP balancePS, SEXP verboseS, SEXP nS, SEXP jumpS) {
  
  BEGIN_RCPP // Rcpp defines the BEGIN_RCPP and END_RCPP macros that should be used to bracket code that might throw C++ exceptions.
  
  bool verbose = is_true( any( LogicalVector(verboseS) ) );
  bool balanceS = is_true( any( LogicalVector(balanceSS) ) );
  bool balanceP = is_true( any( LogicalVector(balancePS) ) );
  int s = IntegerVector(sS)[0];
  int p = IntegerVector(pS)[0];
  int v = IntegerVector(vS)[0];
  IntegerVector n = IntegerVector(nS);
  int n1 = n[0];
  //int n2 = n[1]; This will perhaps be passed to this function. But it is safer to get this value from mlist.size().
  IntegerVector jump = IntegerVector(jumpS);
  int j1 = jump[0];
  int j2 = jump[1];
  int model = IntegerVector(modelS)[0];
  //vec vRep = as<vec>(vRepS); //Not used yet
  //TODO Perhaps using umat or imat for some matrices? (Can casting rcDesign(i,j) to int result in wrong indices.)
  mat linkM = as<mat>(linkMS);
  mat tCC = as<mat>(tCCS); // t(C) %*% C
  //mat design = as<mat>(designS);

  // TODO Read random number generators and C!
  GetRNGstate();
  
  if (verbose) {
    Rprintf("Starting search algorithm!\n");
    tCC.print(Rcout, "t(C)*C:");
    linkM.print(Rcout, "Link Matrix:");
  }
  Rcpp::List mlist(designS);
  int n2 = mlist.size();
  List effList = List(n2); // Here we will store NumericVectors that show the search progress.
  mat design;
  mat bestDesign;
  int effBest = 0;
  mat designOld, designBeforeJump, rcDesign, rcDesign2, Ar;  
  double s1, s2, eOld = 0, eBeforeJump = 0;
  NumericVector rows, cols;
  
  for(int j=0; j<n2; j++) {
    NumericVector eff = NumericVector(n1);
    design = as<mat>(mlist[j]);  
    eOld = 0;     
    for(int i=0; i<n1; i++) {  
      designOld = design;      
      // Now we exchange r times two elements:
      int r = 1;
      if (i%j2==0) {
        r = j1;
        designBeforeJump = design; // If after j2/4 steps no better design is found after the jump, we wil return to the design before the jump
        eBeforeJump = eOld;
      }
      for (int dummy=0; dummy<r; dummy++) { // dummy is never used and just counts the number of exchanges
        rows = ceil(runif(2)*p)-1; 
        cols = ceil(runif(2)*s)-1;  
        if (balanceS) {cols[1] = cols[0];} else if (balanceP) {rows[1] = rows[0];}
        while ( design(rows[0],cols[0]) == design(rows[1],cols[1]) ) { //TODO: Only really stupid user input can cause an infinite loop - nevertheless check for it?
          rows = ceil(runif(2)*p)-1; 
          cols = ceil(runif(2)*s)-1;  
          if (balanceS) {cols[1] = cols[0];} else if (balanceP) {rows[1] = rows[0];}
        }
        double tmp = design(rows[0],cols[0]);
        design(rows[0],cols[0]) = design(rows[1],cols[1]);
        design(rows[1],cols[1]) = tmp;
      }
      
      rcDesign = createRowColumnDesign(design, v, model);
      if (verbose) {
        Rprintf("Rank of rcDesign is: %d\n", rank(trans(rcDesign) * rcDesign)); 
      } 
      //rcDesign2 = createRowColumnDesign2(rcDesign, v+v*v);
      Ar = getInfMatrixOfDesign(rcDesign, v+v*v);
    
      s2 = 1; // We set this constant for the moment
      s1 = trace(pinv(trans(linkM) * Ar * linkM) * tCC) ;
      
      //if (verbose) Rprintf(S2/S1, " vs. ", eOld, " ");
      eff[i] = s2/s1;
      if (s2/s1 > eOld || i%j2==0) { // After a jump we always accept the new matrix for now and test again after j2/2 steps.
        //if (verbose) Rprintf("=> Accepting new matrix.\n");
        eOld = s2/s1;         
      } else {
        //if (verbose) Rprintf("=> Keeping old matrix.\n");
        design = designOld;    
      }
      if ((i%j2==j2/2) && (eBeforeJump>eOld)) { // If after j2/2 steps no better design is found after the jump, we wil return to the design before the jump:
        design = designBeforeJump;
        eOld = eBeforeJump;
      }
      
    }
    if (eOld > effBest) {
      effBest = eOld;
      bestDesign = design;
    }
    effList[j] = eff;
  }
  PutRNGstate();
  return List::create(Named("design")=bestDesign, Named("eff")=effList);  
  END_RCPP
}

SEXP createRCD(SEXP designS, SEXP vS, SEXP modelS) {
  BEGIN_RCPP
  int v = IntegerVector(vS)[0];
  int model = IntegerVector(modelS)[0];
  mat design = as<mat>(designS);  
  return wrap(createRowColumnDesign(design, v, model));
  END_RCPP
}

SEXP getInfMatrix(SEXP designS, SEXP vS) {
  BEGIN_RCPP
  int v = IntegerVector(vS)[0];
  mat design = as<mat>(designS);  
  return wrap(getInfMatrixOfDesign(design, v));
  END_RCPP
}

arma::mat createRowColumnDesign(arma::mat design, int v, int model) {
  if (model==8) { // "Second-order carry-over effects"
    mat rcDesign = design;
    for (unsigned i=1; i<rcDesign.n_rows; i++) {
      if (i!=1) {
        rcDesign.row(i) = design.row(i)+design.row(i-1)*v+design.row(i-2)*v*v;
      } else {
        rcDesign.row(i) = design.row(i)+design.row(i-1)*v;
      }
    }
    return rcDesign;
  } else { //if (model>0 && model<8) {
    mat rcDesign = design;
    for (unsigned i=1; i<rcDesign.n_rows; i++) {
      rcDesign.row(i) = design.row(i)+design.row(i-1)*v;
    }
    return rcDesign;
  }
  throw std::range_error("Model not found. Has to be between 1 and 8.");
  return NULL;
}

arma::mat getRandomMatrix(int s, int p, int v, IntegerVector vRep, bool balanceS, bool balanceP) {
  /*if (balance.s) {
    design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:s,p)), sample)), p, s)
  } else if (balance.p) {
    design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:p,s)), sample)), p, s, byrow=TRUE)
  } else {
    design <- matrix(sample(rep(1:v, v.rep)), p, s)
  }*/ 
  IntegerVector ret = Rcpp::RcppArmadillo::sample(vRep, 3, false);
  /*Constructors:
  mat(vec)
  mat(rowvec)*/
}

arma::mat createRowColumnDesign2(arma::mat rcDesign, int v) {
  mat X = zeros<mat>(rcDesign.n_rows * rcDesign.n_cols, v);
  for (int j=0; j<rcDesign.n_cols; j++) {
    for (int i=0; i<rcDesign.n_rows; i++) {
      X((i - 1) * rcDesign.n_cols + j, rcDesign(i, j)) = 1;
    }
  }
  return(X);
}

//TODO This function is most likely broken:
arma::mat getInfMatrixOfDesign(arma::mat rcDesign, int v) {
  int p = rcDesign.n_rows;
  int s = rcDesign.n_cols;
  vec r = zeros<vec>(v);  
  mat NP = zeros<mat>(v, p);
  mat NS = zeros<mat>(v, s);
  int t;
  //rcDesign.print("RCDesign:");
  for (int i=0; i<p; i++) {
    for (int j=0; j<s; j++) {
      t = rcDesign(i,j)-1;      
      NP(t, i)++;
      NS(t, j)++;
      r(t)++;
    }
  }  
  //NP.print("NP:");
  //NS.print("NS:");
  //r.print("r:");
  mat A = diagmat(r) - (1.0/s)* NP * trans(NP) - (1.0/p)* NS * trans(NS) + (1.0/(p*s))* r * trans(r);
  return A; 
}

    
    