# Multilayer centrality
#'
#' Colors the nodes according to their centrality.
#' @usage ctr_ml (g.list, ctr_type)
#' @param g.list List of igraph objects (multilayer network).
#' @param ctr_type Centrality type ("degree", "betweenness", "closeness").
#' @return A list of igraph objects which nodes are colored.
#' @examples
#'
#' g <- readRDS("examples/Dstool_mlnet.rds")
#'
#'ctrl_ml (g, ctr_type = "degree")
#'ctrl_ml (g, ctr_type = "betweenness")
#'ctrl_ml (g, ctr_type = "closeness")

ctr_ml<-function(g.list, ctr_type){
  require(igraph)
  if(ctr_type == "degree"){
    for(i in 1:length(g.list)){
      ctr_max<-which.max(degree(g.list[[i]]))
      ctr<-degree(g.list[[i]])/degree(g.list[[i]])[ctr_max]
      Redpal<-heat.colors(5, alpha=1)
      hl1<-which(ctr > 0 & ctr <= 0.2)
      V(g.list[[i]])[hl1]$hl<-Redpal[5]
      hl2<-which(ctr > 0.2 & ctr <= 0.4)
      V(g.list[[i]])[hl2]$hl<-Redpal[4]
      hl3<-which(ctr > 0.4 & ctr <= 0.6)
      V(g.list[[i]])[hl3]$hl<-Redpal[3]
      hl4<-which(ctr > 0.6 & ctr <= 0.8)
      V(g.list[[i]])[hl4]$hl<-Redpal[2]
      hl5<-which(ctr > 0.8 & ctr <= 1)
      V(g.list[[i]])[hl5]$hl<-Redpal[1]
      vertex.attributes(g.list[[i]])$hl
    }
  }
  if(ctr_type == "betweenness"){
    for(i in 1:length(g.list)){
      ctr_max<-which.max(betweenness(g.list[[i]]))
      ctr<-betweenness(g.list[[i]])/betweenness(g.list[[i]])[ctr_max]
      Redpal<-heat.colors(5, alpha=1)
      hl1<-which(ctr > 0 & ctr <= 0.2)
      V(g.list[[i]])[hl1]$hl<-Redpal[5]
      hl2<-which(ctr > 0.2 & ctr <= 0.4)
      V(g.list[[i]])[hl2]$hl<-Redpal[4]
      hl3<-which(ctr > 0.4 & ctr <= 0.6)
      V(g.list[[i]])[hl3]$hl<-Redpal[3]
      hl4<-which(ctr > 0.6 & ctr <= 0.8)
      V(g.list[[i]])[hl4]$hl<-Redpal[2]
      hl5<-which(ctr > 0.8 & ctr <= 1)
      V(g.list[[i]])[hl5]$hl<-Redpal[1]
      vertex.attributes(g.list[[i]])$hl
    }
  }
  if(ctr_type == "closeness"){
    for(i in 1:length(g.list)){
      ctr_max<-which.max(closeness(g.list[[i]]))
      ctr<-closeness(g.list[[i]])/closeness(g.list[[i]])[ctr_max]
      Redpal<-heat.colors(5, alpha=1)
      hl1<-which(ctr > 0 & ctr <= 0.2)
      V(g.list[[i]])[hl1]$hl<-Redpal[5]
      hl2<-which(ctr > 0.2 & ctr <= 0.4)
      V(g.list[[i]])[hl2]$hl<-Redpal[4]
      hl3<-which(ctr > 0.4 & ctr <= 0.6)
      V(g.list[[i]])[hl3]$hl<-Redpal[3]
      hl4<-which(ctr > 0.6 & ctr <= 0.8)
      V(g.list[[i]])[hl4]$hl<-Redpal[2]
      hl5<-which(ctr > 0.8 & ctr <= 1)
      V(g.list[[i]])[hl5]$hl<-Redpal[1]
      vertex.attributes(g.list[[i]])$hl
    }
  }
  return(g.list)
}
