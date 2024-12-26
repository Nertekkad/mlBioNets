#' v_colored_ml
#'
#' Assigns a color to each node of a multilayer network depending of their taxonomic level, for example, the phylum.
#' @usage v_colored_ml (g.list, T_table, g_tax, p_tax, g_colors)
#' @param g.list List of igraph objects (multilayer network).
#' @param T_table Taxa table (as data.frame).
#' @param g_tax The taxonomic level at which the nodes will be colored.
#' @param p_tax The taxonomic level at which the network was built.
#' @param g_colors Set of colors. The vector must have the same length of g_tax elements.
#' @return An igraph object.
#' @export
#'
#' @examples
#'
#' library(seqtime)
#' # Loads this library to create a vector with colors
#' library (viridis)
#  c <- sample (viridis(304), 304)
#'
#' data("mlnet_dstoolAB")
#'
#' g <- v_colored_ml (g.list = mlnet_dstoolAB, T_table = david_stool_lineages, g_tax = "Order", p_tax = "Genus", g_colors = c)

v_colored_ml <- function(g.list, T_table, g_tax, p_tax, g_colors){
  for(i in 1:length(g.list)){
    g.list[[i]]<-v_colored(g.list[[i]], T_table, g_tax,
                           p_tax, g_colors)
  }
  return(g.list)
}
