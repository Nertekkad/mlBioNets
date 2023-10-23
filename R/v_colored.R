# v_colored()

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
