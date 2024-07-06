# v_colored_ml
#'
#' Assigns a color to each node of a multilayer network depending of their taxonomic level, for example, the phylum.
#' @usage v_colored_ml (g.list, T_table, g_tax, p_tax, g_colors)
#' @param g.list List of igraph objects (multilayer network).
#' @param T_table Taxa table (as data.frame).
#' @param g_tax The taxonomic level at which the nodes will be colored.
#' @param p_tax The taxonomic level at which the network was built.
#' @param g_colors Set of colors. The vector must have the same length of g_tax elements.
#' @return An igraph object.
#' @examples
#'
#' # Loads this library to create a vector with colors
#' library (viridis)
#  c <- sample (viridis(100), num_nodos)
#'
#' g <- readRDS("examples/Dstool_mlnet.rds")
#'
#' ml_v <- v_colored (g, david_stool_lineages, g_tax = "Family", p_tax = "Order", g_colors=c)
#' # Nodes will be colored by Family, and the net was built by Order
#'
#' plot(ml_v)

v_colored_ml <- function(g.list, T_table, g_tax, p_tax, g_colors){
  for(i in 1:length(g.list)){
    g.list[[i]]<-v_colored(g.list[[i]], T_table, g_tax,
                           p_tax, g_colors)
  }
  return(g.list)
}
