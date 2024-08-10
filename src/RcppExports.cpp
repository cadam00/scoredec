// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// symadj
NumericMatrix symadj(NumericVector Eg, size_t n);
RcppExport SEXP _scoreR_symadj(SEXP EgSEXP, SEXP nSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type Eg(EgSEXP);
    Rcpp::traits::input_parameter< size_t >::type n(nSEXP);
    rcpp_result_gen = Rcpp::wrap(symadj(Eg, n));
    return rcpp_result_gen;
END_RCPP
}
// sum_W_Wt
void sum_W_Wt(NumericMatrix W);
RcppExport SEXP _scoreR_sum_W_Wt(SEXP WSEXP) {
BEGIN_RCPP
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type W(WSEXP);
    sum_W_Wt(W);
    return R_NilValue;
END_RCPP
}
// score_out
IntegerVector score_out(NumericMatrix W, NumericVector str_tmp);
RcppExport SEXP _scoreR_score_out(SEXP WSEXP, SEXP str_tmpSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type W(WSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type str_tmp(str_tmpSEXP);
    rcpp_result_gen = Rcpp::wrap(score_out(W, str_tmp));
    return rcpp_result_gen;
END_RCPP
}
// score_in
IntegerVector score_in(NumericMatrix W, NumericVector str_tmp);
RcppExport SEXP _scoreR_score_in(SEXP WSEXP, SEXP str_tmpSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type W(WSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type str_tmp(str_tmpSEXP);
    rcpp_result_gen = Rcpp::wrap(score_in(W, str_tmp));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_scoreR_symadj", (DL_FUNC) &_scoreR_symadj, 2},
    {"_scoreR_sum_W_Wt", (DL_FUNC) &_scoreR_sum_W_Wt, 1},
    {"_scoreR_score_out", (DL_FUNC) &_scoreR_score_out, 2},
    {"_scoreR_score_in", (DL_FUNC) &_scoreR_score_in, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_scoreR(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
