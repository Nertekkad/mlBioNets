# Creates a data.frame with the degree of each layer's nodes

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
