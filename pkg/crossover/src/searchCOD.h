#ifndef _crossover_SEARCH_H
#define _crossover_SEARCH_H

#include <RcppArmadillo.h>
#include <RcppArmadilloExtensions/sample.h>
#include <R.h>
#include <Rmath.h>

/*
 * note : RcppExport is an alias to `extern "C"` defined by Rcpp.
 *
 * It gives C calling convention to the rcpp_hello_world function so that 
 * it can be called from .Call in R. Otherwise, the C++ compiler mangles the 
 * name of the function and .Call can't find it.
 *
 * It is only useful to use RcppExport when the function is intended to be called
 * by .Call. See the thread http://thread.gmane.org/gmane.comp.lang.r.rcpp/649/focus=672
 * on Rcpp-devel for a misuse of RcppExport
 */

RcppExport SEXP searchCOD(SEXP sS, SEXP pS, SEXP vS, SEXP designS, SEXP linkMS, SEXP CS, SEXP modelS, SEXP effFactorS, SEXP vRepS, SEXP balanceSS, SEXP balancePS, SEXP verboseS, SEXP nS, SEXP jumpS, SEXP s2);

RcppExport SEXP createRCD(SEXP designS, SEXP vS, SEXP modelS);

RcppExport SEXP getInfMatrix(SEXP designS, SEXP vS);

arma::mat createRowColumnDesign(arma::mat design, int v, int model);
arma::mat createRowColumnDesign2(arma::mat rcDesign, int v);
arma::mat getInfMatrixOfDesign(arma::mat rcDesign, int v);

#endif
