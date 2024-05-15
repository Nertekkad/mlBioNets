# log2FC
#'
#' Description
#' @usage log2fc(phyl_ctr_df, control_layer, test_layer)
#' @param phyl_ctr_df A data.frame preprocessed with phyl_ctr_df function.
#' @param control_layer "Name" of control layer.
#' @param test_layer "Name" of test layer.
#' @return Returns a plot of Log Fold Change of the centrality between layers.
#' @examples
#'
#' phcDstool <- readRDS(file = "data/Dstool_phyl_ctr.rds")
#' log2fc (phcDstool, "after_travel", "traveling")

log2fc <- function(phyl_ctr_df, control_layer, test_layer){
  # Control and test layer to compare
  cl <- which(colnames(phyl_ctr_df) == control_layer)
  tl <- which(colnames(phyl_ctr_df) == test_layer)
  # Log-fold change quantification
  log2fc <- -log2((phyl_ctr_df[,cl]+1)/(phyl_ctr_df[,tl]+1))
  df_degree <- data.frame(
    Phylum = phyl_ctr_df$Taxon,
    log2fc = log2fc
  )
  # Plot
  require(ggpubr)
  p1 <- ggbarplot(df_degree, x = "Phylum", y = "log2fc",
                  fill = "Phylum",
                  color = "white",
                  palette = viridis(nrow(df_degree)),
                  sort.val = "desc",
                  sort.by.groups = FALSE,
                  x.text.angle = 90,
                  ylab = "log2fc",
                  rotate = TRUE,
                  ggtheme = theme_minimal()) +
    theme(legend.position = "none")
  return(p1)
}
