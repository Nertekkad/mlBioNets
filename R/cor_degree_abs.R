# Correlation degree abundance
#'
#' Graph the correlation between degree and abundances.
#' @usage cor_degree_abs(g.list, abs.list, layer_names, layer_colors, title)
#' @param g.list List of igraph objects (multilayer network).
#' @param abs.list List of abundances tables.
#' @param layer_names The names of each layer of the network (ex. "control layer").
#' @param layer_colors Assign a color to represent the layer (ex. "pink")
#' @param title Plot's title.
#' @return Returns a correlation plot between the degree and abundance of each node. It shows the R-square and p-value.
#' @examples
#'
#' nDstool <- readRDS(file = "data/Dstool_mlnet")
#'
#' cor_degree_abs (nDstool, david_stool_lineage, layer_names = c("before_travel", "traveling", "after_travel"), layer_colors = c("blue", "purple", "yellow"), title = "Example")
#'

cor_degree_abs<-function(g.list, abs.list, layer_names, layer_colors, title){
  # Data.frame of degree and abundance of each layer
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
