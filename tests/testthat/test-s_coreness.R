test_that("s_coreness g and W work double", {
  # Create a dummy symmetric adjacency matrix
  set.seed(123, "Mersenne-Twister", sample.kind="Rejection")
  n <- 5
  W <- matrix(runif(n^2),n)
  W[lower.tri(W)] <- t(W)[lower.tri(W)]
  diag(W) <- 0
  
  expect_equal(scoredec::s_coreness(g = NULL, W = W, mode = "all"),
               c(3, 1, 2, 4, 4))
  
  # Create a dummy undirected graph
  g <- igraph::graph_from_adjacency_matrix(adjmatrix = W,
                                           mode      = "undirected",
                                           weighted  = TRUE)
  expect_equal(scoredec::s_coreness(g = g, W = NULL, mode = "all"),
               c(3, 1, 2, 4, 4))
  
  # Create a dummy undirected graph
  set.seed(123, "Mersenne-Twister", sample.kind="Rejection")
  n <- 5
  W <- matrix(sample(c(0,1),n^2,replace=TRUE),n)
  W[lower.tri(W)] <- t(W)[lower.tri(W)]
  diag(W) <- 0

  g <- igraph::graph_from_adjacency_matrix(adjmatrix = W,
                                           mode      = "undirected",
                                           weighted  = FALSE)

  expect_equal(scoredec::s_coreness(g = g),
               igraph::coreness(g = g))

  # Test symadj
  set.seed(123, "Mersenne-Twister", sample.kind="Rejection")
  n <- 5
  W <- matrix(runif(n^2),n)
  W[lower.tri(W)] <- t(W)[lower.tri(W)]
  
  g <- igraph::graph_from_adjacency_matrix(adjmatrix = W,
                                           mode      = "undirected",
                                           weighted  = TRUE)
  
  expect_equal(scoredec::s_coreness(g = g),
               c(3, 1, 5, 2, 4))
  
  # Test input mistake
  score <- try(scoredec::s_coreness(g = W), silent = TRUE)
  
  expect_true(class(score) == "try-error")
  
  score <- try(scoredec::s_coreness(g = g, W = W), silent = TRUE)
  
  expect_true(class(score) == "try-error")
  
})

test_that("s_coreness g and W work integer", {
  # Create a dummy symmetric adjacency matrix
  set.seed(123, "Mersenne-Twister", sample.kind="Rejection")
  n <- 5
  W <- matrix(nrow=n,ncol=n)
  W[] <- as.integer(sample(n^2, n^2))
  W[lower.tri(W)] <- t(W)[lower.tri(W)]
  diag(W) <- 0L
  
  expect_equal(scoredec::s_coreness(g = NULL, W = W, mode = "all"),
               c(4, 3, 2, 4, 1))
  
  # Create a dummy undirected graph
  g <- igraph::graph_from_adjacency_matrix(adjmatrix = W,
                                           mode      = "undirected",
                                           weighted  = TRUE)
  igraph::E(g)$weight <- as.integer(igraph::E(g)$weight)
  
  expect_equal(scoredec::s_coreness(g = g, W = NULL, mode = "all"),
               c(4, 3, 2, 4, 1))
  
  # # Create a dummy undirected graph
  # set.seed(123, "Mersenne-Twister", sample.kind="Rejection")
  # n <- 5
  # W <- matrix(sample(c(0,1),n^2,replace=TRUE),n)
  # W[lower.tri(W)] <- t(W)[lower.tri(W)]
  # diag(W) <- 0
  # 
  # g <- igraph::graph_from_adjacency_matrix(adjmatrix = W,
  #                                          mode      = "undirected",
  #                                          weighted  = FALSE)
  # 
  # expect_equal(scoredec::s_coreness(g = g),
  #              igraph::coreness(g = g))
  
  # Test symadj
  set.seed(123, "Mersenne-Twister", sample.kind="Rejection")
  n <- 5
  W <- matrix(nrow=n,ncol=n)
  W[] <- as.integer(sample(n^2, n^2))
  W[lower.tri(W)] <- t(W)[lower.tri(W)]
  
  g <- igraph::graph_from_adjacency_matrix(adjmatrix = W,
                                           mode      = "undirected",
                                           weighted  = TRUE)
  igraph::E(g)$weight <- as.integer(igraph::E(g)$weight)
  
  expect_equal(scoredec::s_coreness(g = g),
               c(4, 3, 2, 2, 1))
  
  # Test input mistake
  score <- try(scoredec::s_coreness(g = W), silent = TRUE)
  
  expect_true(class(score) == "try-error")
  
  score <- try(scoredec::s_coreness(g = g, W = W), silent = TRUE)
  
  expect_true(class(score) == "try-error")
  
  score <- try(scoredec::s_coreness(W = W[1:2, 1:5]), silent = TRUE)
  
  expect_true(class(score) == "try-error")
  
})

test_that("s_coreness mode works double", {
  
  # Create a dummy symmetric adjacency matrix
  set.seed(123, "Mersenne-Twister", sample.kind="Rejection")
  n <- 5
  W <- matrix(runif(n^2),n)
  W[lower.tri(W)] <- t(W)[lower.tri(W)]
  diag(W) <- 0
  
  expect_equal(scoredec::s_coreness(g = NULL, W = W, mode = "all"),
               c(3, 1, 2, 4, 4))
  
  expect_equal(scoredec::s_coreness(g = NULL, W = W, mode = "in"),
               c(3, 1, 2, 4, 4))
  
  expect_equal(scoredec::s_coreness(g = NULL, W = W, mode = "out"),
               c(3, 1, 2, 4, 4))
  
  # Test input mistake
  score <- try(scoredec::s_coreness(g = NULL, W = W, mode = "blabla"),
               silent = TRUE)
  
  expect_true(class(score) == "try-error")
  
})

test_that("s_coreness mode works integer", {
  
  # Create a dummy symmetric adjacency matrix
  set.seed(123, "Mersenne-Twister", sample.kind="Rejection")
  n <- 5
  W <- matrix(nrow=n,ncol=n)
  W[] <- as.integer(sample(n^2, n^2))
  W[lower.tri(W)] <- t(W)[lower.tri(W)]
  diag(W) <- 0L
  
  expect_equal(scoredec::s_coreness(g = NULL, W = W, mode = "all"),
               c(4, 3, 2, 4, 1))
  
  expect_equal(scoredec::s_coreness(g = NULL, W = W, mode = "in"),
               c(4, 3, 2, 4, 1))
  
  expect_equal(scoredec::s_coreness(g = NULL, W = W, mode = "out"),
               c(4, 3, 2, 4, 1))
  
  # Test input mistake
  score <- try(scoredec::s_coreness(g = NULL, W = W, mode = "blabla"),
               silent = TRUE)
  
  expect_true(class(score) == "try-error")
  
})