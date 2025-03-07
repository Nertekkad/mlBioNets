# Identifying and highlighting statistically significant taxa differences in abundance.
#'
#' This function identifies the most abundant taxa and distinguishes between nodes with statistically significant differences in their abundance (red) and those without (blue).
#' @usage diff_nodes_graph(T_Collapsed, n, mat_list, g.list, alpha)
#' @param T_collapsed Abundance table collapsed at a certain taxonomic level (preprocessed by T_collapse).
#' @param n Number of nodes to consider.
#' @param mat_list List of abundance matrices (preprocessed by T_collapse).
#' @param g.list List of igraph objects (multilayer network), just 2 layers.
#' @param alpha Significance. It must be a number between 0 and 1.
#' @return Returns a plot with both networks collapsed.
#' @export
#'
#' @examples
#'
#' data("BN_nets")
#' data("beetle_nightshade")
#' BN_genus <- T_collapse(is_phyloseq = T, ps = beetle_nightshade, names_level = "Genus")
#' # Insect and plant data isolation
#' Insect<-which(sample_data(beetle_nightshade)$Type =="Insect")
#' Insect<-sample_data(beetle_nightshade)$ID[Insect]; Insect
#' Plant<-which(sample_data(beetle_nightshade)$Type =="Plant")
#' Plant<-sample_data(beetle_nightshade)$ID[Plant]; Plant
#' Insectmat <- BN_genus[Insect,]
#' Plantmat <- BN_genus[Plant,]
#' # Network inference
#' insect_sparcc<-net_inference(Insectmat, "sparcc", p = 0.4)
#' plant_sparcc<-net_inference(Plantmat, "sparcc", p = 0.4)
#' # Significant differences between replica nodes
#' mat_list<-list(Insectmat, Plantmat)
#' g.list<-list(insect_sparcc, plant_sparcc)
#' diff_g<-diff_nodes_graph(BN_genus, n = 20, mat_list, g.list, alpha = 0.05)
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
