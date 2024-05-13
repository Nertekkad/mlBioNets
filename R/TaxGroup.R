# TaxGroup
#'
#' Identifies the membership of a node to a certain higher-ranking taxon.
#' @usage TaxGroup(g, T_table, g_tax, p_tax)
#' @param g An igraph object.
#' @param T_table Taxa table as data.frame
#' @param g_tax The taxonomic level at which the nodes will be colored.
#' @param p_tax The taxonomic level at which the network was built.
#' @returns Returns
#' @examples
#'
#' # The input can be a net preprocessed by net_inference
#' # The data is david_stool
#'
#' tcollapsed <- readRDS (file="data/object_tc_dstool.rds")
#'
#' ex <- net_inference(tcollapsed, "aracne")
#' graph <- readRDS("data/dstool_net.rds")
#' TaxGroup (g, T_table = david_stool_lineages, g_tax = "Phylum", p_tax = "Order")

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
