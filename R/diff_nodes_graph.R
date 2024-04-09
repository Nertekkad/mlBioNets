# diff_nodes_graph
#'
#' Identifies the most abundant taxa and recognizes which nodes have significant
#' differences between their abundances (red) and which ones don't (blue).
#' @usage diff_nodes_graph(T_Collapsed, n, mat_list, g.list, alpha)
#' @param T_collapsed Abundance table collapsed at a certain taxonomic level.
#' @param n Number of nodes to considere.
#' @param mat_list List of abundance matrices.
#' @param g.list List of igraph objects (multilayer network).
#' @param alpha Significance. It must be a number between 0 and 1.
#' @return n
#' @examples
#' 1+1
#'

diff_nodes_graph<-function(T_Collapsed, n, mat_list, g.list, alpha){
  require("muxViz")
  #Lists must contain only two objects.
  if(length(mat_list)>2 | length(g.list)>2){
    print("The input must be a bipartite network")
  } else if(length(mat_list)==2 & length(g.list)==2){
    #Considers just the "n" nodes with higher abundances.
    most_ab<-sort(apply(t(T_Collapsed), 1, sum),
                  decreasing = T, index.return = F)[1:n]
    #Isolates the selected abundances.
    most_layer<-list()
    for(i in 1:length(mat_list)){
      most_layer[[i]]<-mat_list[[i]][, names(most_ab)]
    }
    #Layers melt.
    aggregated_g<-GetAggregateNetworkFromNetworkList(g.list)
    #t-test analysis.
    alpha<-alpha
    for(i in 1:length(most_ab)){
      if(t.test(most_layer[[1]][,i], most_layer[[2]][,i])$p.value<=alpha){
        V(aggregated_g)[names(most_ab[i])]$colorA<-"blue"
      } else if(t.test(most_layer[[1]][,i], most_layer[[2]][,i])$p.value>alpha){
        V(aggregated_g)[names(most_ab[i])]$colorA<-"red"
      }
    }
    return(aggregated_g)
  }
}
