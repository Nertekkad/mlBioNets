# T_collapse
#'
#' Group the abundances at a selected taxonomic level. The entrance can be a phyloseq object or a data.frame.
#'
#' @usage T_collapse (is_phyloseq=T, ps=..., names_level=...)
#' @param ps If "is_phyloseq = T", a phyloseq object, and "is_phyloseq = F" for data.frame.
#' @param T_table (If is_phyloseq = F) A taxa table.
#' @param O_table (If is_phyloseq = F) An OTUs/ASV table.
#' @param names_level (If is_phyloseq = F) Taxonomic level to group (ex. class, genus).
#' @return Returns a class array matrix at a selected  taxonomic level.
#' @examples
#' # With BiocManager, package "microbiome"
#' # if is_phyloseq = T
#'
#' library (microbiome)
#' data ("dietswap")
#' T_collapse (is_phyloseq = T, ps = dietswap, names_level ="Phylum")
#'
#' # if is_phyloseq = F
#'
#' library(seqtime)
#' colnames(david_stool_lineages)<- c("ID", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species", "Summary", "ID")
#'
#' T_collapse(F, T_table = david_stool_lineages, O_table = david_stoolA_otus, names_level = "Genus")

T_collapse <- function(is_phyloseq, ps, T_table, O_table, names_level) {
  if(is_phyloseq == T){
    T_table<-as.data.frame(tax_table(ps))
    O_table<-as.data.frame(t(otu_table(ps)))
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
