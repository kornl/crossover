#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .Call calls */
extern SEXP estimable2R(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP getS12R(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP getZ2R(SEXP, SEXP, SEXP);
extern SEXP infMatrix2R(SEXP, SEXP, SEXP, SEXP);
extern SEXP rcd2R(SEXP, SEXP, SEXP);
extern SEXP rcdMatrix2R(SEXP, SEXP, SEXP);
extern SEXP searchCOD(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"estimable2R", (DL_FUNC) &estimable2R,  7},
    {"getS12R",     (DL_FUNC) &getS12R,      6},
    {"getZ2R",      (DL_FUNC) &getZ2R,       3},
    {"infMatrix2R", (DL_FUNC) &infMatrix2R,  4},
    {"rcd2R",       (DL_FUNC) &rcd2R,        3},
    {"rcdMatrix2R", (DL_FUNC) &rcdMatrix2R,  3},
    {"searchCOD",   (DL_FUNC) &searchCOD,   18},
    {NULL, NULL, 0}
};

void R_init_Crossover(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

