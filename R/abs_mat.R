# Abundances matrix function
abs_mat<-function(abs.list, g.list, n){
  # Colors for each node
  abundances<-list()
  for(i in 1:length(abs.list)){
    abundances[[i]]<-log(colSums(abs.list[[i]])+2)/n
  }
  # Input color vector
  abundances<-as.vector(unlist(abundances))
  # Color matrix at cetain taxonomic level
  absmat<-matrix(abundances, nrow = length(V(g.list[[1]])),
                 ncol = length(g.list))
  return(absmat)
}
