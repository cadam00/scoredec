s_coreness <- function(g = NULL, W = NULL, mode = "all") {
  ## Modified code from brainGraph::s_core function
  
  is_null_g <- is.null(g)
  is_null_W <- is.null(W)
  
  if (is_null_g & is_null_W ||(!is_null_g & !is_null_W))
    stop("Provide one of g or W.")
  if(is_null_g) {
    stopifnot(is.matrix(W))
    dims <- dim(W)
    stopifnot(dims[1L] == dims[2L])
  } else {
    stopifnot(is_igraph(g))
  }
  
  if (!((mode == "all") || (mode == "in") || (mode == "out"))){
    stop("'mode' input must be one of 'all', 'in' or 'out'.")
  }
  
  if (is_null_W){
    if (!is_weighted(g)) return(coreness(g, mode = mode))
    # W <- as_adj(g, names=FALSE, sparse=FALSE, attr='weight')
    n <- vcount(g)
    if (!is_directed(g) && (length(E(g)) == ((n * (n - 1) / 2) + n)) ){
      ## Fast adjacency matrix for full connected undirected graph
      if (is.double(E(g)$weight)){
        W <- symadj(E(g)$weight, n)
      } else {
        W <- symadj_int(E(g)$weight, n)
      }
      
    } else {
      W <- as_adj(g, names=FALSE, sparse=FALSE, attr='weight')
    }
  }
  
  if (mode == "all"){
    if (is_null_W){
      if (is.double(W)){
        sum_W_Wt_graph(W)
      } else {
        sum_W_Wt_graph_int(W)
      }
    } else {
      if (is.double(W)){
        sum_W_Wt(W)
      } else {
        sum_W_Wt_int(W)
      }
    }
  }
  
  if (is.double(W)){
    if (mode == "out"){
      return(score_out(W, rowsums(W)))
    } else {
      return(score_in(W, colsums(W)))
    }
  } else {
    if (mode == "out"){
      return(score_out_int(W, rowsums(W)))
    } else {
      return(score_in_int(W, colsums(W)))
    }
  }
  
}