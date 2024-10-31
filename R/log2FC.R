# Quantifying log-fold changes in centrality between network layers
#'
#' Quantifies and compares Log Fold Change value between chosen layers.
#' @usage log2fc (phyl_ctr_df, control_layer, test_layer)
#' @param phyl_ctr_df A data.frame preprocessed with phyl_ctr_df function.
#' @param control_layer "Name" of control layer.
#' @param test_layer "Name" of test layer.
#' @return Returns a Log Fold Change plot of the centrality between layers.
#' @export
#'
#' @examples
#'
#' data("phyl_ctr_dstool")
#'
#' log2fc (phyl_ctr_dstool, control_layer = "sample A", test_layer = "sample B")


log2fc <- function(phyl_ctr_df, control_layer, test_layer){
  require(ggpubr)
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
