# T_collapse
#'
#'Adds the abundances at a certain taxonomic level
#'
#' @usage T_collapse (T_table, O_table, names_level)
#' @param ps A phyloseq object
#' @param T_table A taxa table
#' @param O_table An OTU table (ASV?)
#' @param names_level Taxonomic level to separate _
#' @return Returns a class array matrix at a certain taxonomic level.
#' @examples 1+1


T_collapse <- function(is_phyloseq, ps, T_table, O_table, names_level) {
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

# Error in delayedAssign(x, ps, eval.env, assign.env) :
#  cannot change value of locked binding for 'ps'
