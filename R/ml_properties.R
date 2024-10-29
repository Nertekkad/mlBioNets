# Multilayer network properties
#'
#' Quantifies different topological properties of a multilayer network.
#' @usage ml_properties (g.list, treatments)
#' @param g.list List of igraph objects (multilayer network).
#' @param treatments A vector with the names of each layer.
#' @returns The function returns a data.frame, which contains networks' topological metrics.
#' @examples
#'
#' data (mlnet_dstoolAB)
#'
#' # The vector with layers' names
#' t <- c("before", "after")
#'
#' ml_properties (mlnet_dstoolAB, treatments = t)

ml_properties<-function(g.list, treatments){
  # Mean degree
  mean_degree<-c()
  for(i in 1:length(g.list)){
    mean_degree[i]<-mean(degree(g.list[[i]]))
  }
  # Standard deviation of degree
  sd_degree<-c()
  for(i in 1:length(g.list)){
    sd_degree[i]<-sd(degree(g.list[[i]]))
  }
  # Transitivity
  clusterization<-c()
  for(i in 1:length(g.list)){
    clusterization[i]<-transitivity(g.list[[i]])
  }
  # Edge density
  e_density<-c()
  for(i in 1:length(g.list)){
    e_density[i]<-edge_density(g.list[[i]])
  }
  # Connected nodes
  nodes_connected<-c()
  for(i in 1:length(g.list)){
    nodes_connected[i]<-length(which(degree(g.list[[i]])>0))/length(degree(g.list[[i]]))
  }
  # Modularity
  modularity_score<-c()
  for(i in 1:length(g.list)){
    wtc <- cluster_walktrap(g.list[[i]])
    modularity_score[i]<-modularity(wtc)
  }
  # Table
  df_properties<-data.frame(
    "Treatments" = treatments,
    "Mean_degree" = mean_degree,
    "sd_degree" = sd_degree,
    "Clusterization" = clusterization,
    "Edge_density" = e_density,
    "Connected_nodes" = nodes_connected,
    "Modularity" = modularity_score
  )
  return(df_properties)
}
