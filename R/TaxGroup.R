# TaxGroup

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
