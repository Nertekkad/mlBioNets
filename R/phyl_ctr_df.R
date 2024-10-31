# Generating a data.frame of summed centrality values for a specified taxonomic level.
#'
#' This function generates a data.frame containing the summed centrality values at a specified taxonomic level.
#' @usage phyl_ctr_df (ctr_df, layer_names, n_layers)
#' @param ctr_df Data.frame pre-processed with ctr_df function.
#' @param layer_names Name of the layers.
#' @param n_layers Number of layers.
#' @returns A data.frame with one column per layer with their centrality value.
#' @export
#'
#' @examples
#'
#' data("ctr_df_dstool")
#'
#' # Create a vector with layers' names
#' n <- c("sample A", "sample B")
#'
#' phyl_ctr_df (ctr_df_dstool, layer_names = n, n_layers = 2)

phyl_ctr_df <- function(ctr_df, layer_names, n_layers){
  require(viridis)
  # Sums the centrality values at a certain taxonomic level in everylayer
  phyla<-unique(ctr_df$g_tax)
  ml_phyl_d <- list()
  for(j in 1:n_layers){
    phyl_d<-c()
    for(i in 1:length(phyla)){
      phyl_d[i] <- sum(ctr_df[, j][which(ctr_df$g_tax %in% phyla[i])])
    }
    ml_phyl_d[[j]] <- phyl_d
  }
  # Creates a data.frame of centrality at the chosen taxonomic level
  degree_df1 <- as.data.frame(matrix(unlist(ml_phyl_d),
                                     nrow = length(ml_phyl_d[[1]]),
                                     ncol = length(ml_phyl_d)))
  colnames(degree_df1) <- layer_names
  # Adds de colors and names
  degree_df2<-data.frame(
    Taxon=phyla,
    Colors=sample(viridis(100), length(phyla))
  )
  # Eliminates unrelevant elements
  not_degree <- which(rowSums(degree_df1) == 0)
  ctr_df <- cbind(degree_df1,degree_df2)
  ctr_df <- ctr_df[-not_degree,]
  return(ctr_df)
}

