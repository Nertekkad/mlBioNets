# v_colored
#'
#' Assign a color to each node of a network depending of a certain taxonomic level,
#' for example, the phylum.
#' @usage v_colored(g, T_table, g_tax, p_tax, g_colors)
#' @param g An igraph object.
#' @param T_table Taxa table as data.frame.
#' @param g_tax The taxonomic level at which the nodes will be colored.
#' @param p_tax The taxonomic level at which the network was built.
#' @param g_colors Set of colors. The vector must have the same length of g_tax elements.
#' @return An igraph object
#' @examples
#'
#'library(viridis)
# sample(viridis(100), num_nodos)
#'
#' graph <- readRDS("data/dstool_net.rds")
#'
#' v <- v_colored (graph, david_stool_lineages, g_tax = "Family", p_tax = "Order",
#' g_colors = )
#' # Nodes will be colored by Family, and the net was built by Order
#'
#' plot(v)
#'

v_colored<-function(g, T_table, g_tax, p_tax, g_colors){
  require(igraph)
  # Unique groups at a certain taxonomic level
  unq<-unique(T_table[,g_tax])
  # Color assignment to each node
  for(i in 1:length(unq)){
    IDs<-which(unq[i] == T_table[,g_tax])
    t_names<-unique(T_table[p_tax][IDs,])
    vertex<-which(vertex.attributes(g)$name %in% t_names)
    V(g)[vertex]$color<-g_colors[i]
  }
  return(g)
}
