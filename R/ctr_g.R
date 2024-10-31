# Color-coding network nodes by centrality.
#'
#' This function assigns colors to the network nodes based on their centrality measurements.
#' @usage ctr_g (g, ctr_type)
#' @param g An igraph object.
#' @param ctr_type Centrality type ("degree", "betweenness" or "closeness").
#' @return An igraph object with colored nodes.
#' @export
#'
#' @examples
#'
#' data ("net_dstoolA")
#' ctr_g (net_dstoolA, ctr_type = "degree")
#' ctr_g (net_dstoolA, ctr_type = "closeness")
#'
#' data ("net_dstoolB")
#' ctr_g (net_dstoolB, ctr_type = "betweenness")
#' ctr_g (net_dstoolB, ctr_type = "degree")

ctr_g<-function(g, ctr_type){
  require(igraph)
  if(ctr_type == "degree"){
    ctr_max<-which.max(degree(g))
    ctr<-degree(g)/degree(g)[ctr_max]
    Redpal<-heat.colors(5, alpha=1)
    hl1<-which(ctr > 0 & ctr <= 0.2)
    V(g)[hl1]$hl<-Redpal[5]
    hl2<-which(ctr > 0.2 & ctr <= 0.4)
    V(g)[hl2]$hl<-Redpal[4]
    hl3<-which(ctr > 0.4 & ctr <= 0.6)
    V(g)[hl3]$hl<-Redpal[3]
    hl4<-which(ctr > 0.6 & ctr <= 0.8)
    V(g)[hl4]$hl<-Redpal[2]
    hl5<-which(ctr > 0.8 & ctr <= 1)
    V(g)[hl5]$hl<-Redpal[1]
    vertex.attributes(g)$hl
  }
  if(ctr_type == "betweenness"){
    ctr_max<-which.max(betweenness(g))
    ctr<-betweenness(g)/betweenness(g)[ctr_max]
    Redpal<-heat.colors(5, alpha=1)
    hl1<-which(ctr > 0 & ctr <= 0.2)
    V(g)[hl1]$hl<-Redpal[5]
    hl2<-which(ctr > 0.2 & ctr <= 0.4)
    V(g)[hl2]$hl<-Redpal[4]
    hl3<-which(ctr > 0.4 & ctr <= 0.6)
    V(g)[hl3]$hl<-Redpal[3]
    hl4<-which(ctr > 0.6 & ctr <= 0.8)
    V(g)[hl4]$hl<-Redpal[2]
    hl5<-which(ctr > 0.8 & ctr <= 1)
    V(g)[hl5]$hl<-Redpal[1]
    vertex.attributes(g)$hl
  }
  if(ctr_type == "closeness"){
    ctr_max<-which.max(closeness(g))
    ctr<-closeness(g)/closeness(g)[ctr_max]
    Redpal<-heat.colors(5, alpha=1)
    hl1<-which(ctr > 0 & ctr <= 0.2)
    V(g)[hl1]$hl<-Redpal[5]
    hl2<-which(ctr > 0.2 & ctr <= 0.4)
    V(g)[hl2]$hl<-Redpal[4]
    hl3<-which(ctr > 0.4 & ctr <= 0.6)
    V(g)[hl3]$hl<-Redpal[3]
    hl4<-which(ctr > 0.6 & ctr <= 0.8)
    V(g)[hl4]$hl<-Redpal[2]
    hl5<-which(ctr > 0.8 & ctr <= 1)
    V(g)[hl5]$hl<-Redpal[1]
    vertex.attributes(g)$hl
  }
  return(g)
}
