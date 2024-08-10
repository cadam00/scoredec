s_coreness <- function(g = NULL, W = NULL, mode = "all") {
  ## Modified code from brainGraph::s_core function
  
  is_null_g <- is.null(g)
  is_null_W <- is.null(W)
  
  if (is_null_g & is_null_W ||(!is_null_g & !is_null_W))
    stop("Provide one of g or W.")
  
  if(!is_null_g) stopifnot(is_igraph(g))
  
  if (!((mode == "all") || (mode == "in") || (mode == "out"))){
    stop("'mode' input must be one of 'all', 'in' or 'out'.")
  }
  
  if (is_null_W){
    if (!is_weighted(g)) return(coreness(g, mode = mode))
    # W <- as_adj(g, names=FALSE, sparse=FALSE, attr='weight')
    n <- vcount(g)
    if (!is_directed(g) && (length(E(g)) == (n * (n - 1) / 2 + n)) ){
      ## Fast adjacency matrix for full connected undirected graph
      W <- symadj(E(g)$weight, vcount(g))
    } else {
      W <- as_adj(g, names=FALSE, sparse=FALSE, attr='weight')
    }
  }
  
  if (mode == "all"){
    sum_W_Wt(W)
  }
  
  if (mode == "out"){
    return(score_out(W, rowsums(W)))
  } else {
    return(score_in(W, colsums(W)))
  }
  
}