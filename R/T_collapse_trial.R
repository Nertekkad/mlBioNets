# T_collapse
#'
#' Adds the abundances at a certain taxonomic level.
#'
#' @usage T_collapse (is_phyloseq)
#' @param ps If "is_phyloseq = T" A phyloseq object.
#' @param T_table (If is_phyloseq = F) You have to introduce a taxa table.
#' @param O_table (If is_phyloseq = F) An OTU table.
#' @param names_level (If is_phyloseq = F) Taxonomic level to separate.
#' @param ps A phyloseq object
#' @param T_table A taxa table
#' @param O_table An OTU table (ASV?)
#' @param names_level Taxonomic level to separate
#' @return Returns a class array matrix at a certain taxonomic level.
#' @examples
#' # With BiocManager, package "microbiome"
#' # if is_phyloseq = T
#'
#' library (microbiome)
#' data ("dietswap")
#' T_collapse (is_phyloseq = T, ps = ps2, names_level ="Genus")
#'
#' # if is_phyloseq = F
#'
#' T_collapse(F, T_table = david_stool_lineages, O_table = david_stoolA_otus, names_level = "V7")


T_collapse_trial <- function(is_phyloseq, ps, T_table, O_table, names_level) {
  if(is_phyloseq == T){
    T_table<-as.data.frame(tax_table(ps))
    O_table<-as.data.frame(t(otu_table(ps))) # t?
    # Unique taxa identification
    unq<-unique(T_table[,names_level]); unq
    # Sum of abundances of the same taxa
    mat <- matrix(, nrow = length(O_table), ncol = 0)
    for(i in 1:length(unq)){
      a<-which(T_table[,names_level] %in% unq[i]); a
      b<-as.matrix(colSums(O_table[a,]))
      mat<-cbind(mat, b)
    }
    # Taxa names assignment
    colnames(mat)<-unq
    return(mat)
  }
  else if(is_phyloseq == F){
    # Unique taxa identification
    unq<-unique(T_table[,names_level]); unq
    # Sum of abundances of the same taxa
    mat <- matrix(, nrow = length(O_table), ncol = 0)
    for(i in 1:length(unq)){
      a<-which(T_table[,names_level] %in% unq[i]); a
      b<-as.matrix(colSums(O_table[a,]))
      mat<-cbind(mat, b)
    }
    # Taxa names assignment
    colnames(mat)<-unq
    return(mat)
  }
}
