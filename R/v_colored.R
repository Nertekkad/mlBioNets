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
#' @return An igraph object.
#'
#'
#' @import viridis
#'
#' @examples
#'
#' # Load this library to create a vector with colors
#' library(viridis)
#' c <- sample(viridis(152), 152)
#'
#' data ("net_dstoolA")
#'
#' g <- v_colored(net_dstoolA, T_table = david_stool_lineages, g_tax = "Class",
#' p_tax = "Family", g_colors = c)
#'
#' plot(g)
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
