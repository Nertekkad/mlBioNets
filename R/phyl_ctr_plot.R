# Displaying phylum centrality.
#'
#' This function displays the  centrality measure of each phylum.
#' @usage phyl_ctr_plot (phyl_ctr_df, layer_name, title)
#' @param phyl_ctr_df A data.frame preprocessed by phyl_ctr_df
#' @param layer_name Name of the layer to graph/plot.
#' @param title Name for the graph.
#' @returns A bar plot of degree importance for each phylum.
#' @export
#'
#' @import viridis
#' @examples
#'
#' data ("phyl_ctr_dstool")
#'
#' n <- c("Sample A", "Sample B")
#'
#' phyl_ctr_plot (phyl_ctr_dstool, layer_name = "Sample A", title = "Graph 1")

phyl_ctr_plot<-function(phyl_ctr_df, layer_name, title){
  # Barplot of degree centrality at certain taxonomic level
  l<-which(colnames(phyl_ctr_df) == layer_name)
  require(ggplot2)
  p1<-ggplot(phyl_ctr_df, aes(x = reorder(phyl_ctr_df$Taxon, -phyl_ctr_df[,l]),
                              y = phyl_ctr_df[,l], fill = Taxon)) +
    geom_bar(stat = "identity") +
    labs(title = title) +
    xlab("Phylum") + ylab("Degree") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    theme(legend.position = "none") + scale_fill_viridis(discrete = TRUE)
  return(p1)
}
