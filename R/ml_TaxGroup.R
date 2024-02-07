# Assigns the taxonomic membership of the nodes
ml_TaxGroup <- function(g.list, T_table, g_tax, p_tax){
  gtax<-list()
  for(i in 1:length(g.list)){
    gtax[[i]] <- TaxGroup(g.list[[i]], T_table, g_tax, p_tax)
  }
  return(gtax)
}
