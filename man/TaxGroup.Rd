\name{g_abundace}
\alias{g_abundance}
\title{g_abundance}
\usage{
TaxGroup(g, T_table, g_tax, p_tax)
}
\description{
Identifies the membership of a node to a certain higher-ranking taxon.
}
\arguments{
\item{g}{An \emph{igraph} object.}

\item{T_table}{Taxa table as \emph{data.frame}.}

\item{g_tax}{The taxonomic level at which the nodes will be colored.}

\item{p_tax}{The taxonomic level at which the network was built.}
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

# Phylum identification for each node
insect_sparCC<-TaxGroup(insect_sparCC, T_table, "Phylum", "Genus")
plant_sparCC<-TaxGroup(plant_sparCC, T_table, "Phylum", "Genus")
vertex.attributes(insect_sparCC)$Taxon[1:12]
}
