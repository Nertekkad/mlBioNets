# Abundances matrix function
#' This function colors nodes by abundance at a taxonomic level.
#' @usage abs_mat (abs.list, g.list, n)
#' @param abs.list Abundance list, the same lists you used to generate the network.
#' @param g.list List of igraph objects (multilayer network).
#' @param n Vertex number. Notice that if n>20 the nodes won't show too big.
#' @return Returns a matrix, each column is a layer, and the values of the rows corresponds to the size of each node.
#' @examples
#'
#' data (mlnet_dstool)
#'
#' abs_mat(abs.list = david_stool_lineages, g.list = mlnet_dstool, n=10)

abs_mat<-function(abs.list, g.list, n){
  # Colors for each node
  abundances<-list()
  for(i in 1:length(abs.list)){
    abundances[[i]]<-log(colSums(abs.list[[i]])+2)/n
  }
  # Input color vector
  abundances<-as.vector(unlist(abundances))
  # Color matrix at cetain taxonomic level
  absmat<-matrix(abundances, nrow = length(V(g.list[[1]])),
                 ncol = length(g.list))
  return(absmat)
}
