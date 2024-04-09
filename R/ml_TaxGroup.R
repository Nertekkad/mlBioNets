# Multilayer Tax Group
#'
#' Assigns the taxonomic membership of the nodes.
#' @usage ml_TaxGroup(g.list, T_table, g_tax, p_tax)
#' @param g.list List of igraph objects (multilayer network).
#' @param T_table Taxa table.
#' @param g_tax description
#' @param p_tax description
#' @returns n
#' @examples
#' n

ml_TaxGroup <- function(g.list, T_table, g_tax, p_tax){
  gtax<-list()
  for(i in 1:length(g.list)){
    gtax[[i]] <- TaxGroup(g.list[[i]], T_table, g_tax, p_tax)
  }
  return(gtax)
}
