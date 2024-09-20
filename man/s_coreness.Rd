\name{s_coreness}
\alias{s_coreness}
\title{
s-core community decomposition
}
\description{
s-core community decomposition 
}
\usage{
s_coreness(g = NULL, W = NULL, mode = "all")	
}
\arguments{
\item{g}{
\code{igraph} object. It is a weighted graph. If it is not weighted, then the
\code{igraph::coreness} function will be used.
It can be used as an alternative to \code{W}.
}
\item{W}{
\code{matrix} object. It is an adjacency matrix. It can be used as an
alternative to \code{g}.
}
\item{mode}{
\code{character} object. It can be one of \code{"all"}, \code{"in"} or
\code{"out"}.
}
}
\details{
s-core community decomposition implementation. Only one of \code{g} or \code{W}
must be provided.

While the source code is not as clear as the one at \code{brainGraph::s_core},
it is very speed and memory efficient. In case that the adjacency matrix
\code{W} is provided instead of the graph \code{g} is provided, then this
function is very speed and memory efficient.

Note that in cases that the adjacency matrix \code{W} is known to be symmetric
(checked, for example, with \code{base::isSymmetric} or
\code{Rfast::is.symmetric}), then \code{mode = "in"} and \code{mode = "out"}
will produce the same result more efficiently. For efficiency reasons not
checking it is chosen, but user should do it.
}

\value{
Integer vector with s-coreness attribute to each vertex.
}

\references{
Eidsaa, M. and Almaas, E. (2013) ‘s-core network decomposition: A generalization
of k-core analysis to weighted networks’, \emph{Phys. Rev. E.}, American
Physical Society, \bold{88}, 062819. \doi{10.1103/PhysRevE.88.062819}.

Watson, C.G. (2024). brainGraph: Graph Theory Analysis of Brain MRI Data.
R package version 3.1.0. \doi{10.32614/CRAN.package.brainGraph}.
}

\examples{
set.seed(42)

## Create a dummy symmetric adjacency matrix
n <- 5
W <- matrix(runif(n^2),n)
W[lower.tri(W)] = t(W)[lower.tri(W)]
diag(W) <- 0

print(scoredec::s_coreness(g = NULL, W = W, mode = "all"))
#> [1] 3 1 2 4 4

base::isSymmetric(W)
#> [1] TRUE

all.equal(scoredec::s_coreness(g = NULL, W = W, mode = "all"),
scoredec::s_coreness(g = NULL, W = W, mode = "in"))
#> [1] TRUE

# Create a dummy undirected graph
g <- igraph::graph_from_adjacency_matrix(adjmatrix = W,
                                         mode      = "undirected",
                                         weighted  = TRUE)
print(scoredec::s_coreness(g = g, W = NULL, mode = "all"))
#> [1] 3 1 2 4 4
}