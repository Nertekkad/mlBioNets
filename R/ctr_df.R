# Generating a data.frame of node degrees per layer.
#'
#' The function ctr_df generates a data.frame containing the degree of nodes for each layer.
#' @usage ctr_df (g.list, layer_names)
#' @param g.list List of igraph objects (multilayer network), preprocessed by ml_TaxGroup.
#' @param layer_names Vector with the name of each layer.
#' @return Returns a data.frame with centrality value (if preprocessed with ctr_ml or ctr_g: degree, betweenness or closeness), p_tax and g_tax of each node (the function takes this info from ml_TaxGroup).
#' @export
#'
#' @examples
#'
#' #Load the example net
#' data (mlTaxGroup_dstool)
#'
#' # Create a vector with layers' names
#' v <- c("sample A", "sample B")
#'
#' ctr_df (mlTaxGroup_dstool, layer_names = v)

ctr_df <- function(g.list, layer_names){
  # Identificates the degree of the nodes at each layer
  degree_ml <- list()
  for(i in 1:length(g.list)){
    degree_ml[[i]] <- degree(g.list[[i]])
  }
  # Creates a data.frame with the output information
  degree_df1 <- as.data.frame(matrix(unlist(degree_ml),
                                     nrow = length(degree_ml[[1]]),
                                     ncol = length(degree_ml)))
  colnames(degree_df1) <- layer_names
  # Adds the names and taxon membership
  degree_df2 <- data.frame(p_tax = vertex.attributes(g.list[[1]])$name,
                           g_tax = vertex.attributes(g.list[[1]])$Taxon)
  ctr_df <- cbind(degree_df1,degree_df2)
  return(ctr_df)
}
