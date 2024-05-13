# Abundances matrix function
#'
#' Colors nodes according to their abundance.
#' @usage abs_mat(abs.list, g.list, n)
#' @param abs.list Abundance list
#' @param g.list List of igraph objects (multilayer network).
#' @param n A vertex
#' @return Returns an igraph object.
#' @examples
#'
#' dstool_net <- readRDS(file = "data/Dstool_mlnet.rds")
#' abs_mat(david_stool_lineage, dstool_net, 2)

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
