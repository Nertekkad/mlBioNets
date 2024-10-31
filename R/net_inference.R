# Network inference function
#'
#' Allows to infer a co-abundance network from an abundance table.
#' @usage net_inference (taxa_abs, method)
#' @param taxa_abs An abundance table (data.frame) preprocessed with function T_collapse.
#' @param method The method to create the network ("sparcc" or "aracne").
#' @param p When method="sparcc", a threshold between 0-1.
#' @return The function returns an igraph object representing the existing co-abundances between nodes at a certain taxonomic level.
#' @export
#'
#' @examples
#'
#' data ("tc_dstoolA")
#' net_inference (tc_dstoolA, method = "aracne")
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
