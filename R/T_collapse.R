# T_collapse()

T_collapse<-function(is_phyloseq, ps, T_table, O_table, names_level){
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
