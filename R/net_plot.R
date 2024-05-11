# Network plotting
#'
#' Create a graph of the network.
#' @usage net_plot(g, type)
#' @param g An igraph object preprocessed by v_colored or ctr_g functions.
#' @param type You can choose between "phylo" or "centrality".
#' @return An igraph object..
#' @examples
#'
#' graph <- readRDS("data/dstool_net.rds")
#' net_plot (graph, type = "centrality")
#' net_plot (graph, type = "phylo")

net_plot<-function(g, type){
  # Taxonomic classification
  if(type == "phylo"){
    return(plot(g, vertex.label.color="black",
                vertex.color = vertex.attributes(g)$color, vertex.label.cex=.5,
                vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5))
  } else
  # Centrality
  if(type == "centrality"){
    return(plot(g, vertex.label.color="black",
                vertex.color = vertex.attributes(g)$hl, vertex.label.cex=.5,
                vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5))
  }
}

