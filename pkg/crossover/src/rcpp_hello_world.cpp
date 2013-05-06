#include "rcpp_hello_world.h"

SEXP rcpp_hello_world(){
    using namespace Rcpp ;
    
    CharacterVector x = CharacterVector::create( "foo", "bar" )  ;
    NumericVector y   = NumericVector::create( 0.0, 1.0 ) ;
    List z            = List::create( x, y ) ;
    
    return z ;
}

SEXP rcpp_hello_world2(SEXP vs) {
  arma::vec v = Rcpp::as<arma::vec>(vs);
  arma::mat op = v * v.t();
  double ip = arma::as_scalar(v.t() * v);
  return Rcpp::List::create(Rcpp::Named("outer")=op, Rcpp::Named("inner")=ip);
}