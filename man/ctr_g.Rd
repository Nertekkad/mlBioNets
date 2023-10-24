\name{ctr_g}
\alias{ctr_g}
\title{ctr_g}
\usage{
ctr_g(g, ctr_type)
}
\description{
Colors the nodes according to their centrality.
}
\arguments{
\item{g}{An \emph{igraph} object.}

\item{ctr_type}{Centrality type ("degree", "betweenness" or "closeness").}
}

\examples{
# Load packages and data
library(mlBioNets)
library(phyloseq)
data("ps2")

# Otus and taxa tables
T_table<-as.data.frame(tax_table(ps2))
O_table<-as.data.frame(t(otu_table(ps2)))

# Let's collapse the tables at genus level
T_Collapsed<-T_collapse(T_table = T_table, O_table = O_table, names_level = "Genus")

# Separate insect and plant data
Insect<-which(sample_data(ps2)$Type =="Insect")
Insect<-sample_data(ps2)$ID[Insect]
Plant<-which(sample_data(ps2)$Type =="Plant")
Plant<-sample_data(ps2)$ID[Plant]
Insectmat <- T_Collapsed[Insect,]
Plantmat <- T_Collapsed[Plant,]

# Coabundance networks

library(SpiecEasi)
library(igraph)

# Insect (beetle)
sparccNet<-sparcc(Insectmat)
sparccNet <- abs(sparccNet$Cor) >= 0.4
insect_sparCC<-adj2igraph(sparccNet)
vertex.attributes(insect_sparCC) <- list(name = colnames(Insectmat))

# Plot the centrality
insect_sparCC<-ctr_g(insect_sparCC, ctr_type = "degree")
plot(insect_sparCC, vertex.label.color="black",
     vertex.color = vertex.attributes(insect_sparCC)$hl, vertex.label.cex=.5,
     vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5)
title(main = "Insect")
}
