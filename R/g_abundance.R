# g_abundance

g_abundance<-function(layer_mat, g){
  # Relative abundances quantification
  net_ab<-colSums(layer_mat)
  net_ab<-as.numeric((net_ab)/net_ab[which.max(net_ab)])
  # Colors for each abundance level
  abcol<-topo.colors(5)
  # Color assignment to the nodes depending on their abundance
  ab1<-which(net_ab > 0 & net_ab <= 0.2)
  V(g)[ab1]$rel_ab<-abcol[5]
  ab2<-which(net_ab > 0.2 & net_ab <= 0.4)
  V(g)[ab2]$rel_ab<-abcol[4]
  ab3<-which(net_ab > 0.4 & net_ab <= 0.6)
  V(g)[ab3]$rel_ab<-abcol[3]
  ab4<-which(net_ab > 0.6 & net_ab <= 0.8)
  V(g)[ab4]$rel_ab<-abcol[2]
  ab5<-which(net_ab > 0.8 & net_ab <= 1)
  V(g)[ab5]$rel_ab<-abcol[1]
  vertex.attributes(g)$rel_ab
  return(g)
}
