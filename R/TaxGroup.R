#' TaxGroup
#'
#' This function identifies the membership of a node to a certain higher-ranking taxon.
#' @usage TaxGroup(g, T_table, g_tax, p_tax)
#' @param g An igraph object.
#' @param T_table Taxa table as data.frame
#' @param g_tax The taxonomic level at which the nodes will be colored.
#' @param p_tax The taxonomic level at which the network was built.
#' @returns Returns an igraph object with nodes colored based on their taxonomic rank.
#' @examples
#'
#' # The input can be a net pre-processed by net_inference
#' # This example uses david_stool data set
#'
#' data (tc_dstool)
#' g <- net_inference (tc_dstool, "aracne")
#'
#' TaxGroup (g, T_table = david_stool_lineages, g_tax = "Order", p_tax = "Genus")

TaxGroup<-function(g, T_table, g_tax, p_tax){
  require(igraph)
  unq<-unique(T_table[,g_tax])
  for(i in 1:length(unq)){
    IDs<-which(unq[i] == T_table[,g_tax])
    t_names<-unique(T_table[p_tax][IDs,])
    vertex<-which(vertex.attributes(g)$name %in% t_names)
    V(g)[vertex]$Taxon<-unq[i]
  }
  return(g)
}
