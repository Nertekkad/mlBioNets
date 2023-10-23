# T_collapse()

T_collapse<-function(T_table, O_table, names_level){
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
