# Network plotting
net_plot<-function(g, type){
  # Taxonomic classification
  if(type == "phylo"){
    return(plot(g, vertex.label.color="black",
                vertex.color = vertex.attributes(g)$color, vertex.label.cex=.5,
                vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5))
  } else
  # Centrality
  if(type == "centrality"){
    return(plot(g, vertex.label.color="black",
                vertex.color = vertex.attributes(g)$hl, vertex.label.cex=.5,
                vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5))
  }
}

