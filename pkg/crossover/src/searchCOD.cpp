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

SEXP searchCOD(SEXP sS, SEXP pS, SEXP vS, SEXP designS, SEXP linkMS, SEXP CS, SEXP modelS, SEXP effFactorS, SEXP vRepS, SEXP balanceSS, SEXP balancePS, SEXP verboseS, SEXP nS, SEXP jumpS, SEXP s2S) {
  
  BEGIN_RCPP // Rcpp defines the BEGIN_RCPP and END_RCPP macros that should be used to bracket code that might throw C++ exceptions.
  
  //bool verbose = is_true( any( LogicalVector(verboseS) ) );
  int verbose = IntegerVector(verboseS)[0];
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
  double s2 = NumericVector(s2S)[0];
  //vec vRep = as<vec>(vRepS); //Not used yet
  //TODO Perhaps using umat or imat for some matrices? (Can casting rcDesign(i,j) to int result in wrong indices.)
  mat linkM = as<mat>(linkMS);
  mat C = as<mat>(CS); // Contrasts
  mat tCC = trans(C) * C; // t(C) %*% C
  //mat design = as<mat>(designS);

  // TODO Read random number generators and C!
  GetRNGstate();
  
  if (verbose) {
    Rprintf("Starting search algorithm (s=%d, p=%d, v=%d)!\n", s, p, v);
    tCC.print(Rcout, "t(C)*C:");
    linkM.print(Rcout, "Link Matrix:");
  }
  Rcpp::List mlist(designS);
  int n2 = mlist.size();
  List effList = List(n2); // Here we will store NumericVectors that show the search progress.
  mat design;
  mat bestDesign, bestDesignOfRun;
  int effBest = 0, r;
  mat designOld, rcDesign, Ar, A, Xr, X, XX, XXXX;  // designBeforeJump, 
  double s1, eOld = 0, estCriterion; // eBeforeJump = 0,
  NumericVector rows, cols;
  
  for(int j=0; j<n2; j++) {  
    NumericVector eff = NumericVector(n1);
    design = as<mat>(mlist[j]);      
    eOld = s2/getS1(createRowColumnDesign(design, v, model), v, model, linkM, tCC);
    bestDesignOfRun = design;
    
    if (verbose) {
      Rprintf("**** Start design %d ****\n", j);   
      design.print(Rcout, "Start design:");
    }
    for(int i=0; i<n1; i++) {  
      designOld = design;        
      // Now we exchange r times two elements: TODO Move exchange part behind the evaluation part (otherwise a really great start design might got lost).
      r = 1;
      if (i%j2==0) {
        r = j1;        
      }
      for (int dummy=0; dummy<r; dummy++) { // dummy is never used and just counts the number of exchanges
        rows = ceil(runif(2)*p)-1; 
        cols = ceil(runif(2)*s)-1;  
        if (balanceS) {cols[1] = cols[0];} else if (balanceP) {rows[1] = rows[0];}
        while ( design(rows[0], cols[0]) == design(rows[1],cols[1]) ) { //TODO: Only really stupid user input can cause an infinite loop - nevertheless check for it?
          rows = ceil(runif(2)*p)-1; 
          cols = ceil(runif(2)*s)-1;  
          if (balanceS) {cols[1] = cols[0];} else if (balanceP) {rows[1] = rows[0];}
        }
        double tmp = design(rows[0],cols[0]);
        design(rows[0], cols[0]) = design(rows[1], cols[1]);
        design(rows[1], cols[1]) = tmp;
      }
      
      mat rcDesign = createRowColumnDesign(design, v, model);
      s1 = getS1(rcDesign, v, model, linkM, tCC);      
      
      if (s2/s1 >= eOld) {
        if (verbose>2) {
          Rprintf("Yeah, s2/s1=%f is greater or equal to eOld=%f.\n", s2/s1, eOld);
        }
        Xr = createRowColumnDesign2(rcDesign, v+v*v);
        X = Xr * linkM;
        XX = trans(X) * X;
        XXXX = pinv(XX) * XX;
        X = abs(C * XXXX - C);
        estCriterion = X.max(); // Criterion to test whether contrasts are estimable - see Theorem \ref{thr:estimable} of vignette.
        if (estCriterion > 0.0001) {
          if (verbose>2) {
            Rprintf("But unfortunately estimability criterion is: %f.\n", estCriterion); 
          }
          eff[i] = NA_REAL;
          //TODO Check whether it's better to go back or to let algorithm search further (I guess often it's better to go back, but I'm not sure).
        } else { // We have found a great design!
          eOld = s2/s1;   
          eff[i] = s2/s1;
          bestDesignOfRun = design;
          if (verbose>2) {
            bestDesignOfRun.print(Rcout, "Best design of run:");
            Rprintf("Eff of design is: %f.\n", eOld);
          }          
          if (eOld > effBest) {
            effBest = eOld;
            bestDesign = bestDesignOfRun;
          }
        }
      } else {        
        design = designOld;
      } 
    } /* End hill climbing */
    effList[j] = eff;
  } /* End for loop start designs */
  if (verbose) {
    bestDesignOfRun.print(Rcout, "Best design overall:");
    rcDesign = createRowColumnDesign(bestDesignOfRun, v, model);      
    Ar = getInfMatrixOfDesign(rcDesign, v+v*v);
    s1 = trace(pinv(trans(linkM) * Ar * linkM) * tCC) ;
    Rprintf("Eff of design is: %f=%f.\n", effBest, s2/s1);
    
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

double getS1(mat rcDesign, int v, int model, mat linkM, mat tCC) {  
  mat Ar = getInfMatrixOfDesign(rcDesign, v+v*v);
  mat A = trans(linkM) * Ar * linkM;
  double s1 = trace(pinv(A) * tCC);
  return s1;
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

// C equivalent to getRCDesignMatrix
// v=v+v*v for all models but full interaction, where v=v+v*v+v*v*v
arma::mat createRowColumnDesign2(arma::mat rcDesign, int v) {
  mat X = zeros<mat>(rcDesign.n_rows * rcDesign.n_cols, v);
  for (int j=0; j<rcDesign.n_cols; j++) {
    for (int i=0; i<rcDesign.n_rows; i++) {
      X(i * rcDesign.n_cols + j, rcDesign(i, j)-1) = 1;
    }
  }
  return(X);
}
/*
getRCDesignMatrix <- function(rcDesign, v) {
  X <- matrix(0, prod(dim(rcDesign)), v)
  for (j in 1:(dim(rcDesign)[2])) {
    for (i in 1:(dim(rcDesign)[1])) {
      X[(i-1)*(dim(rcDesign)[2])+j,rcDesign[i,j]] <- 1
    }
  }
  return(X)
}
*/

// v=v+v*v for all models but full interaction, where v=v+v*v+v*v*v
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
    