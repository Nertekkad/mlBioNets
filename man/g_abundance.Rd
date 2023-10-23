\name{g_abundace}
\alias{g_abundance}
\title{g_abundance}
\usage{
g_abundance(layer_mat, g)
}
\description{
Assign a color to each node depending of the relative abundance.
}
\arguments{
\item{layer_mat}{Abundance \emph{data.frame}.}

\item{g}{An \emph{igraph} object.}
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

# Plant (solanaceous)
sparccNet<-sparcc(Plantmat)
sparccNet <- abs(sparccNet$Cor) >= 0.4
plant_sparCC<-adj2igraph(sparccNet)
vertex.attributes(plant_sparCC) <- list(name = colnames(Plantmat))

# Nodes colored according to the relative abundances
insect_sparCC<-g_abundance(layer_mat = Insectmat, g = insect_sparCC)
plant_sparCC<-g_abundance(layer_mat = Plantmat, g = plant_sparCC)
plot(insect_sparCC, vertex.label.color="black",
      vertex.color = vertex.attributes(insect_sparCC)$rel_ab, vertex.label.cex=.5,
      vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5)
plot(plant_sparCC, vertex.label.color="black",
      vertex.color = vertex.attributes(plant_sparCC)$rel_ab, vertex.label.cex=.5,
      vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5)
}
