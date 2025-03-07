#' Correlation between degree and abundance
#' Graphing Pearson correlation between degree and abundance.
#' @usage cor_degree_abs(g.list, abs.list, layer_names, layer_colors, title)
#' @param g.list List of igraph objects (multilayer network).
#' @param abs.list List of abundances tables.
#' @param layer_names The names of each layer of the network (ex. "control layer").
#' @param layer_colors Assign a color to represent the layer (ex. "pink")
#' @param title Plot's title.
#' @return Returns a correlation plot between the degree and abundance of each node. It shows the R-square and p-value.
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
#' # Degree vs. abundance plot
#' BN_ml<-list(insect_sparcc, plant_sparcc)
#' BN_abs<-list(Insectmat, Plantmat)
#' cor_degree_abs(g.list = BN_ml, abs.list = BN_abs, layer_names = c("Beetle", "Nightshade"), layer_colors = c("red4", "green4"), title = "Beetle-nightshade")
#'

cor_degree_abs<-function(g.list, abs.list, layer_names, layer_colors, title){
  # Data.frame of degree and abundance of each layer
  require(ggplot2)
  require(ggpubr)
  cordf<-list()
  for(i in 1:length(abs.list)){
    cordf[[i]]<-data.frame(
      Abundances = colSums(abs.list[[i]]),
      Degree = degree(g.list[[i]]),
      Class = rep(layer_names[i], ncol(abs.list[[i]]))
    )
  }
  # Data.frames binding
  cordf2 <- data.frame()
  for(i in 1:length(cordf)){
    cordf2 <- rbind(cordf2, cordf[[i]])
  }
  cordf2<-cordf2[-which((cordf2$Abundances+cordf2$Degree)==0),]
  # Plot
  p1<-ggplot(cordf2, aes(x = Abundances, y = Degree, color = Class)) +
    geom_point() +
    stat_cor(method = "pearson", cor.coef.name = "R2", size = 4, label.x.npc = 0.6,
             label.y.npc = 0.9) +
    scale_color_manual(values = layer_colors) +
    labs(title = title)
  return(p1)
}
