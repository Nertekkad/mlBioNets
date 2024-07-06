# Node-color matrix function
#'
#' Create a matrix that contains the assigned colors for the nodes of a multilayer network.
#' @usage node_color_mat (g.list, type)
#' @param g.list List of igraph objects.
#' @param type "phylo" assigns the colors according to a certain taxonomic level; "centrality" assings the colors according to the centrality level.
#' @return Returns a heatmap of the multilayer network according the type you chose.
#' @examples
#'
#' g <- readRDS (file = "examples/Dstool_mlnet.rds")
#' node_color_mat (g, type = "phylo")
#'
#' node_color_mat (g, type = "centrality")

node_color_mat<-function(g.list, type){
  if(type == "phylo"){
    # Colors for each node
    taxacolors<-list()
    for(i in 1:length(g.list)){
      taxacolors[[i]]<-V(g.list[[i]])$color
    }
    # Input color vector
    taxacolors<-unlist(taxacolors)
    # Color matrix at certain taxonomic level
    taxamat<-matrix(taxacolors, nrow = length(V(g.list[[1]])),
                    ncol = length(g.list))
    return(taxamat)
  } else
    if(type == "centrality"){
      # Colors for each node
      centrality<-list()
      for(i in 1:length(g.list)){
        centrality[[i]]<-V(g.list[[i]])$hl
      }
      # Input color vector
      centrality<-unlist(centrality)
      # Color matrix at cetain taxonomic level
      heatmat<-matrix(centrality, nrow = length(V(g.list[[1]])),
                      ncol = length(g.list))
      return(heatmat)
    }
}
