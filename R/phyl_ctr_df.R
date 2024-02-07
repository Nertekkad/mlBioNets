# Creates a data.frame of the sums of centrality values at a chosen taxonomic level

phyl_ctr_df <- function(ctr_df, layer_names, n_layers){
  # Sums the centrality values at a certain taxonomic level in everylayer
  phyla<-unique(BTad_degree$g_tax)
  ml_phyl_d <- list()
  for(j in 1:n_layers){
    phyl_d<-c()
    for(i in 1:length(phyla)){
      phyl_d[i] <- sum(BTad_degree[, j][which(BTad_degree$g_tax %in% phyla[i])])
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
    Colors=colors
  )
  # Eliminates unrelevant elements
  not_degree <- which(rowSums(degree_df1) == 0)
  ctr_df <- cbind(degree_df1,degree_df2)
  ctr_df <- ctr_df[-not_degree,]
  return(ctr_df)
}
