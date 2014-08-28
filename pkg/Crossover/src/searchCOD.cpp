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

SEXP searchCOD(SEXP sS, SEXP pS, SEXP vS, SEXP designS, SEXP linkMS, SEXP contrastS, SEXP modelS, SEXP vRepS, SEXP balanceSS, SEXP balancePS, SEXP verboseS, SEXP nS, SEXP jumpS, SEXP s2S, SEXP checkES, SEXP randomSS, SEXP correlationS, SEXP interchangeS) {
  
  BEGIN_RCPP // Rcpp defines the BEGIN_RCPP and END_RCPP macros that should be used to bracket code that might throw C++ exceptions.
  
  //bool verbose = is_true( any( LogicalVector(verboseS) ) );
  int verbose = IntegerVector(verboseS)[0];
  bool balanceS = is_true( any( LogicalVector(balanceSS) ) );
  bool balanceP = is_true( any( LogicalVector(balancePS) ) );
  bool checkE = is_true( any( LogicalVector(checkES) ) );
  bool randomS = is_true( any( LogicalVector(randomSS) ) );
  bool interchange = is_true( any( LogicalVector(interchangeS) ) );
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
  mat cor;
  if (!Rf_isNull( correlationS )) cor = as<mat>(correlationS);
  mat C = as<mat>(contrastS); // Contrasts
  mat tCC = trans(C) * C; // t(C) %*% C
  mat Z = getZ(s,p, randomS);
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
  List designsFound (n2);
  List effList = List(n2); // Here we will store NumericVectors that show the search progress.
  mat design;
  mat bestDesign = as<mat>(mlist[0]);
  mat bestDesignOfRun;
  int r, t;
  mat designOld, rcDesign, Ar, A;  // designBeforeJump, 
  double s1, eOld = 0, effBest = 0; // eBeforeJump = 0,
  NumericVector rows, cols;  
  
  for(int j=0; j<n2; j++) {  
    List designsFoundSingleRun (0);
    NumericVector eff = NumericVector(n1);
    design = as<mat>(mlist[j]);      
    eOld = 0;
    bestDesignOfRun = design;    
    
    if (verbose) {
      Rprintf("**** Start design %d ****\n", j);   
      design.print(Rcout, "Start design:");
    }
    for(int i=0; i<n1; i++) {  
      designOld = design;        
      // Now we exchange r times two elements: TODO Move exchange part behind the evaluation part (otherwise a really great start design might got lost).
      r = 1;
      if (i==0) { // Exception: We want the given start design to be the first in the list!
          r=0;
      } else if (i%j2==0) {
        r = j1; //TODO Add random +- value. Jumps of always the same length may be not optimal.       
      }
      for (int dummy=0; dummy<r; dummy++) { // dummy is never used and just counts the number of exchanges
        rows = ceil(runif(2)*p)-1; 
        cols = ceil(runif(2)*s)-1;  
        if (interchange || i%2==0) {
          if (balanceS) {cols[1] = cols[0];} else if (balanceP) {rows[1] = rows[0];}
          while ( design(rows[0], cols[0]) == design(rows[1],cols[1]) ) { //TODO: Only really stupid user input can cause an infinite loop - nevertheless check for it?
            rows = ceil(runif(2)*p)-1; 
            cols = ceil(runif(2)*s)-1;  
            if (balanceS) {cols[1] = cols[0];} else if (balanceP) {rows[1] = rows[0];}
          }
          double tmp = design(rows[0],cols[0]);
          design(rows[0], cols[0]) = design(rows[1], cols[1]);
          design(rows[1], cols[1]) = tmp;
        } else {
          t = ceil(runif(1)*v)[0];
          design(rows[0], cols[0]) = t;
        }
      }
      
      mat rcDesign = rcd(design, v, model);
      if (verbose) rcDesign.print(Rcout, "rcDesign:");
      if (!Rf_isNull( correlationS )) {
          if (verbose) rcdMatrix(rcDesign, v, model).print(Rcout, "rcdMatrix:");
          mat X = rcdMatrix(rcDesign, v, model) * linkM;
          if (verbose) design.print(Rcout, "X:");
          mat Z = getZ(rcDesign.n_cols,rcDesign.n_rows, randomS);
          if (verbose) design.print(Rcout, "Z:");
          X = join_rows(X, Z);
          if (verbose) design.print(Rcout, "cor:");
          pinv(trans(X) * cor * X);
          //Rprintf("* long calc *\n");
          s1 = trace(pinv(trans(X) * cor * X) * join_rows(join_cols(tCC, zeros<mat>(Z.n_cols, tCC.n_cols)),zeros<mat>(tCC.n_rows+Z.n_cols,Z.n_cols))); // TODO Cut submatrix from pinv(t(X)*X) instead of adding zeros to tCC.
      } else {
          s1 = getS1((model==3||model==7||model==9)?design:rcDesign, v, model, linkM, tCC, randomS);      
      }
      
      if (s2/s1 > eOld) { 
        if (verbose>2) {
          Rprintf("Yeah, s2/s1=%f is greater to eOld=%f.\n", s2/s1, eOld);
        }
        if(checkE && !estimable(rcDesign, v, model, linkM, C, Z, verbose)) {          
          eff[i] = NA_REAL;
          //TODO Check whether it's better to go back or to let algorithm search further (I guess often it's better to go back, but I'm not sure).
        } else { // We have found a great design!
          eOld = s2/s1;   
          eff[i] = s2/s1;
          bestDesignOfRun = design;
          char ci[20];
          sprintf(ci, "%d", i);
          designsFoundSingleRun[(std::string("step")+ci).c_str()] = bestDesignOfRun;
          if (verbose>2) {
            bestDesignOfRun.print(Rcout, "Best design of run:");
            Rprintf("Eff of design is: %f.\n", eOld);
          }          
          if (eOld > effBest) {
            if (verbose>1) { Rprintf("This is even the best design so far, since %f > %f.\n", eOld, effBest); } 
            effBest = eOld;
            bestDesign = bestDesignOfRun;
          }
        }
      } else {       
        eff[i] = NA_REAL;
        design = designOld;
      } 
    } /* End hill climbing */
    designsFound[j] = designsFoundSingleRun;
    effList[j] = eff;
  } /* End for loop start designs */
  if (verbose) {
    bestDesign.print(Rcout, "Best design overall:");
    rcDesign = rcd(bestDesign, v, model);      
    Ar = infMatrix(rcDesign, v, model);
    s1 = trace(pinv(trans(linkM) * Ar * linkM) * tCC) ;
    Rprintf("Eff of design is: %f=%f.\n", effBest, s2/s1);    
  }
  PutRNGstate();
  return List::create(Named("design")=bestDesign, Named("eff")=effList, Named("designs")=designsFound);  
  END_RCPP
}

bool estimable(mat rcDesign, int v, int model, mat linkM, mat C, mat Z, int verbose) {
    mat Xr, X, XX, XXXX, C2;
    Xr = rcdMatrix(rcDesign, v, model);
    X = Xr * linkM;
    X = join_rows(X, Z);
    XX = trans(X) * X;
    XXXX = pinv(XX) * XX;
    C2 = join_rows(C, zeros<mat>(C.n_rows, Z.n_cols));
    X = abs(C2 * XXXX - C2);
    if (verbose>2) {
        rcDesign.print(Rcout, "rcDesign:");
        Xr.print(Rcout, "Xr:");
        XXXX.print(Rcout, "XXXX:");
        X.print(Rcout, "X:");
    }
    double estCriterion = X.max(); // Criterion to test whether contrasts are estimable - see Theorem \ref{thr:estimable} of vignette.
    if (verbose>2) {
        Rprintf("The estimability criterion is: %f.\n", estCriterion); 
    }
    return(estCriterion < 0.0000001);
}

SEXP estimable2R(SEXP rcDesignS, SEXP vS, SEXP modelS, SEXP linkMS, SEXP contrastS, SEXP ZS, SEXP verboseS) {    
    BEGIN_RCPP
    mat rcDesign = as<mat>(rcDesignS);    
    int v = IntegerVector(vS)[0];    
    int model = IntegerVector(modelS)[0];    
    mat linkM = as<mat>(linkMS);  
    mat C = as<mat>(contrastS);  
    mat Z = as<mat>(ZS);  
    int verbose = IntegerVector(verboseS)[0];
    return wrap(estimable(rcDesign, v, model, linkM, C, Z, verbose));
    END_RCPP
}

SEXP rcd2R(SEXP designS, SEXP vS, SEXP modelS) {
  BEGIN_RCPP
  int v = IntegerVector(vS)[0];
  int model = IntegerVector(modelS)[0];
  mat design = as<mat>(designS);  
  return wrap(rcd(design, v, model));
  END_RCPP
}

SEXP rcdMatrix2R(SEXP rcDesignS, SEXP vS, SEXP modelS) {
  BEGIN_RCPP
  int v = IntegerVector(vS)[0];
  int model = IntegerVector(modelS)[0];
  mat rcDesign = as<mat>(rcDesignS);  
  return wrap(rcdMatrix(rcDesign, v, model));
  END_RCPP
}

SEXP infMatrix2R(SEXP designS, SEXP vS, SEXP modelS) {
  BEGIN_RCPP
  int v = IntegerVector(vS)[0];
  int model = IntegerVector(modelS)[0];
  mat design = as<mat>(designS);  
  return wrap(infMatrix(design, v, model));
  END_RCPP
}

SEXP getZ2R(SEXP sS, SEXP pS, SEXP randomSS) {
  BEGIN_RCPP
  bool randomS = is_true( any( LogicalVector(randomSS) ) );
  int s = IntegerVector(sS)[0];
  int p = IntegerVector(pS)[0];
  return wrap(getZ(s, p, randomS));
  END_RCPP
}

arma::mat getZ(int s, int p, bool randomS) {
    //eye<mat>(p,p).print(Rcout, "diag(p):");
    //ones<mat>(1,s).print(Rcout, "matrix(1,1,s):");
    if (randomS) {
      return kron(eye<mat>(p,p),ones<mat>(s,1));
    }
    return join_rows(kron(eye<mat>(p,p),ones<mat>(s,1)),kron(ones<mat>(p,1),eye<mat>(s,s)));
}

arma::mat rcd(arma::mat design, int v, int model) {
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
  } else if (model>0 && model<8) {
    mat rcDesign = design;
    for (unsigned i=1; i<rcDesign.n_rows; i++) {
      rcDesign.row(i) = design.row(i)+design.row(i-1)*v;
    }
    return rcDesign;
  } else if (model==9) {
    return design;
  }
  throw std::range_error("Model not found. Has to be between 1 and 9.");
  return NULL;
}

SEXP getS12R(SEXP designS, SEXP vS, SEXP modelS, SEXP linkMS, SEXP contrastS, SEXP randomSS) {
  BEGIN_RCPP
  bool randomS = is_true( any( LogicalVector(randomSS) ) );
  int v = IntegerVector(vS)[0];
  int model = IntegerVector(modelS)[0];
  mat design = as<mat>(designS);  
  mat rcDesign = rcd(design, v, model);
  mat linkM = as<mat>(linkMS);
  mat C = as<mat>(contrastS); // Contrasts
  mat tCC = trans(C) * C; // t(C) %*% C
  return wrap(getS1(rcDesign, v, model, linkM, tCC, randomS));
  END_RCPP
}

double getS1(mat rcDesign, int v, int model, mat linkM, mat tCC, bool randomS) {  
    if (model==3 || model==7 || model==9) { // in this case rcDesign is actually design
        mat X = designMatrix(rcDesign, v, model);
        //Rprintf("Calculating Z and S1."); 
        mat Z = getZ(rcDesign.n_cols,rcDesign.n_rows, randomS);
        X =  join_rows(X, Z);
        return trace(pinv(trans(X) * X) * join_rows(join_cols(tCC, zeros<mat>(Z.n_cols, tCC.n_cols)),zeros<mat>(tCC.n_rows+Z.n_cols,Z.n_cols))); // TODO Cut submatrix from pinv(t(X)*X) instead of adding zeros to tCC.
    }
  mat Ar = infMatrix(rcDesign, v, model);
  mat A = trans(linkM) * Ar * linkM;
  double s1 = trace(pinv(A) * tCC);
  return s1;
}

arma::mat designMatrix(arma::mat design, int v, int model) {
    mat X;
    if (model==3) { // Proportional model:
        X = zeros<mat>(design.n_rows * design.n_cols, v);
        for (unsigned j=0; j<design.n_cols; j++) {
            for (unsigned i=0; i<design.n_rows; i++) {
                X(i * design.n_cols + j, design(i, j)-1) = 1;
                if (i>0) {
                    X(i * design.n_cols + j, design(i-1, j)-1) += 0.5; // TODO Hardcoded proportion 0.5
                }
            }
        }
    } else if (model==7) { // Full set of interactions:
        //Rprintf("Creating design matrix.\n"); 
        //design.print(Rcout, "Design:");
        X = zeros<mat>(design.n_rows * design.n_cols, 2*v+v*v);
        for (unsigned j=0; j<design.n_cols; j++) {
            for (unsigned i=0; i<design.n_rows; i++) {
                //Rprintf("i: %d, j: %d, t: %f, t-1: %f.\n", i, j, design(i, j), design(i>0?i-1:i, j));
                X(i * design.n_cols + j, design(i, j)-1) = 1;                    
                if (i>0) {
                    // Carry-over:
                    X(i * design.n_cols + j, v+design(i-1, j)-1) = 1;
                    // Interactions:
                    X(i * design.n_cols + j, 2*v+(design(i, j)-1)*v+design(i-1, j)-1) = 1;
                }
            }
        }
    } else if (model==9) {
       X = zeros<mat>(design.n_rows * design.n_cols, v);
        for (unsigned j=0; j<design.n_cols; j++) {
            for (unsigned i=0; i<design.n_rows; i++) {
                X(i * design.n_cols + j, design(i, j)-1) = 1;
            }
        }
    }
    return X;
}

SEXP designMatrix2R(SEXP designS, SEXP vS, SEXP modelS) {
  BEGIN_RCPP
  int v = IntegerVector(vS)[0];
  int model = IntegerVector(modelS)[0];
  mat design = as<mat>(designS);  
  return wrap(designMatrix(design, v, model));
  END_RCPP
}

//arma::mat getRandomMatrix(int s, int p, int v, IntegerVector vRep, bool balanceS, bool balanceP) {
  /*if (balance.s) {
    design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:s,p)), sample)), p, s)
  } else if (balance.p) {
    design <- matrix(unlist(tapply(rep(1:v, v.rep), as.factor(rep(1:p,s)), sample)), p, s, byrow=TRUE)
  } else {
    design <- matrix(sample(rep(1:v, v.rep)), p, s)
  }*/ 
//  IntegerVector ret = Rcpp::RcppArmadillo::sample(vRep, 3, false);
  /*Constructors:
  mat(vec)
  mat(rowvec)*/
//}

arma::mat rcdMatrix(arma::mat rcDesign, int v, int model) {
    int vv = v+v*v;
    if (model==9) { vv = v; }
    if (model==8) { vv = v+v*v+v*v*v; }
    mat X = zeros<mat>(rcDesign.n_rows * rcDesign.n_cols, vv);
    for (unsigned j=0; j<rcDesign.n_cols; j++) {
        for (unsigned i=0; i<rcDesign.n_rows; i++) {
            X(i * rcDesign.n_cols + j, rcDesign(i, j)-1) = 1;
        }
    }
    return(X);
}

arma::mat infMatrix(arma::mat rcDesign, int v, int model) {
    if (model == 3 || model == 7) {
         return NULL; // TODO Throw more meaningful error.
    }
    int vv = v+v*v;
    if (model==8) { vv = v+v*v+v*v*v; }
    
  int p = rcDesign.n_rows;
  int s = rcDesign.n_cols;
  vec r = zeros<vec>(vv);  
  mat NP = zeros<mat>(vv, p);
  mat NS = zeros<mat>(vv, s);
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
    