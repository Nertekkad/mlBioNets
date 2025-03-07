# diff_plot
#'
#' Plot diff_nodes_graph object.
#'
#' This function identifies the most abundant taxa and distinguishes between nodes with statistically significant differences in their abundance (red) and those without (blue). The size of the nodes is proportional to the abundances.
#' @usage diff_plot(diff_g, T_collapsed)
#' @param diff_g igraph object obtained with diff_nodes_graph function.
#' @param T_collapsed Abundance table collapsed at a certain taxonomic level (preprocessed by T_collapse).
#' @return Returns a plot with both networks collapsed.
#' @export
#'
#' @examples
#'
#' data("BN_nets")
#' data("beetle_nightshade")
#' BN_genus <- T_collapse(is_phyloseq = T, ps = beetle_nightshade, names_level = "Genus")
#' # Insect and plant data isolation
#' library("phyloseq")
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
#' diff_plot(diff_g = diff_g, T_collapsed = BN_genus)
#'


diff_plot<-function(diff_g, T_collapsed){
  abundances<-colSums(T_collapsed)
  abundances_log<-log(abundances)/log(max(abundances))
  diff_g_plot<-plot(diff_g, vertex.label.color="black", vertex.color = vertex.attributes(diff_g)$colorA,
                  vertex.label.cex=.5, vertex.label.dist=1,layout=layout_with_kk,
                  vertex.size = abundances_log*5)
  return(diff_g_plot)
}
