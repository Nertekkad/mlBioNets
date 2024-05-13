# Multilayer Tax Group
#'
#' Assigns the taxonomic membership of the nodes.
#' @usage ml_TaxGroup(g.list, T_table, g_tax, p_tax)
#' @param g.list List of igraph objects (multilayer network).
#' @param T_table Taxa table.
#' @param g_tax The taxonomic level at which the nodes will be assigned.
#' @param p_tax The taxonomic level at which the network was built.
#' @returns The function returns a multilayer network (g.list) with each node named according its taxonomic level.
#' @examples
#'
#' mlDstool <- readRDS(file = "data/Dstool_mlnet")
#' colnames(david_stool_lineages)<- c("ID", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species", "Summary", "ID")
#'
#' ml_TaxGroup (mlDstool, david_stool_lineages, g_tax = "Phylum", p_tax = "Family")

ml_TaxGroup <- function(g.list, T_table, g_tax, p_tax){
  gtax<-list()
  for(i in 1:length(g.list)){
    gtax[[i]] <- TaxGroup(g.list[[i]], T_table, g_tax, p_tax)
  }
  return(gtax)
}
