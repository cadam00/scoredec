# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

symadj <- function(Eg, n) {
    .Call(`_scoredec_symadj`, Eg, n)
}

sum_W_Wt_graph <- function(W) {
    invisible(.Call(`_scoredec_sum_W_Wt_graph`, W))
}

sum_W_Wt <- function(W) {
    .Call(`_scoredec_sum_W_Wt`, W)
}

score_out <- function(W, str_tmp) {
    .Call(`_scoredec_score_out`, W, str_tmp)
}

score_in <- function(W, str_tmp) {
    .Call(`_scoredec_score_in`, W, str_tmp)
}

symadj_int <- function(Eg, n) {
    .Call(`_scoredec_symadj_int`, Eg, n)
}

sum_W_Wt_graph_int <- function(W) {
    invisible(.Call(`_scoredec_sum_W_Wt_graph_int`, W))
}

sum_W_Wt_int <- function(W) {
    .Call(`_scoredec_sum_W_Wt_int`, W)
}

score_out_int <- function(W, str_tmp) {
    .Call(`_scoredec_score_out_int`, W, str_tmp)
}

score_in_int <- function(W, str_tmp) {
    .Call(`_scoredec_score_in_int`, W, str_tmp)
}

