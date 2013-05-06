#include "rcpp_hello_world.h"

SEXP rcpp_hello_world(){
    using namespace Rcpp ;
    
    CharacterVector x = CharacterVector::create( "foo", "bar" )  ;
    NumericVector y   = NumericVector::create( 0.0, 1.0 ) ;
    List z            = List::create( x, y ) ;
    
    return z ;
}

SEXP rcpp_hello_world2(SEXP vs) {
  using namespace arma;
  using namespace Rcpp;
  
  vec v = as<vec>(vs);
  mat op = v * v.t();
  double ip = as_scalar(v.t() * v);
  return List::create(Named("outer")=op, Named("inner")=ip);
}