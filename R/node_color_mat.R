# Node-color matrix function
node_color_mat<-function(g.list, type){
  if(type == "phylo"){
    # Colors for each node
    taxacolors<-list()
    for(i in 1:length(g.list)){
      taxacolors[[i]]<-V(g.list[[i]])$color
    }
    # Input color vector
    taxacolors<-unlist(taxacolors)
    # Color matrix at certain taxonomic level
    taxamat<-matrix(taxacolors, nrow = length(V(g.list[[1]])),
                    ncol = length(g.list))
    return(taxamat)
  } else
    if(type == "centrality"){
      # Colors for each node
      centrality<-list()
      for(i in 1:length(g.list)){
        centrality[[i]]<-V(g.list[[i]])$hl
      }
      # Input color vector
      centrality<-unlist(centrality)
      # Color matrix at cetain taxonomic level
      heatmat<-matrix(centrality, nrow = length(V(g.list[[1]])),
                      ncol = length(g.list))
      return(heatmat)
    }
}
