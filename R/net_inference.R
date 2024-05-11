# Network inference function
#'
#' Colors the nodes according to their centrality.
#' @usage net_inference (taxa_abs, method, p)
#' @param taxa_abs An abundance table, preprocessed with function T_collapse.
#' @param method The method to create the network ("sparcc", "aracne")
#' @param p When method="sparcc", a threshold between 0-1.
#' @return Description
#' @examples
#'
#' sparcc_net <- net_inference(a, "sparcc", 0.4)
#' multilayer_net <- load ("data/obj_ml.RData")
#' plot (multilayer_net)
#'
#' aracne_net <- net_inference(a, "aracne")
#' aracne_obj <- load ("data/obj_aracne.RData")
#' plot(aracne_obj)

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
