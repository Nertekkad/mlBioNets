# Network plotting
#'
#' Create a graph of the network.
#' @usage net_plot(g, type)
#' @param g An igraph object preprocessed by v_colored or ctr_g functions.
#' @param type ("phylo", "centrality").
#' @return An igraph object with
#' @examples
#' # x <- 1
#' # 1+x
#' 1+x
#'

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

