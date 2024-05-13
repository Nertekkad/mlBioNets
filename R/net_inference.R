# Network inference function
#'
#' Colors the nodes according to their centrality.
#' @usage net_inference (taxa_abs, method)
#' @param taxa_abs An abundance table, preprocessed with function T_collapse.
#' @param method The method to create the network ("sparcc", "aracne")
#' @param p When method="sparcc", a threshold between 0-1.
#' @return The function returns an igraph object..
#' @examples
#'
#' object_tc <- readRDS(file = "data/object_tc_dietswap.rds")
#' sparccnet <- net_inference (object_tc, "sparcc", 0.4)
#' plot (sparccnet)
#'
#'
#' object_tc2 <- readRDS(file = "data/object_tc_dstool.rds")
#' aracnet <- net_inference (object_tc2, "aracne")
#' plot (aracnet)
#'

net_inference<-function(taxa_abs, method, p){
  require(SpiecEasi)
  require(igraph)
  require(minet)
  # SparCC method
  if(method == "sparcc"){
    sparccNet <- sparcc(taxa_abs)
    sparccNet <- abs(sparccNet$Cor) >= p
    taxa_net <- adj2igraph(sparccNet)
    vertex.attributes(taxa_net) <- list(name = colnames(taxa_abs))
    return(taxa_net)
  }
  # ARACNe method
  else if(method == "aracne"){
    mim <- build.mim(taxa_abs,estimator="spearman")
    aracnet <- aracne(mim)
    taxa_net <- graph.adjacency(aracnet)
    taxa_net <- as.undirected(taxa_net)
    return(taxa_net)
  }
}
