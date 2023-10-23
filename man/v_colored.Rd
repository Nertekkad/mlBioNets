\name{v_colored}
\alias{v_colored}
\title{v_colored}
\usage{
v_colored(g, T_table, g_tax, p_tax, g_colors)
}
\description{
Assign a color to each node depending of a certain taxonomic level. For example, the phylum.
}
\arguments{
\item{g}{An \emph{igraph} object.}

\item{T_table}{Taxa table as \emph{data.frame}.}

\item{g_tax}{The taxonomic level at which the nodes will be colored.}

\item{p_tax}{The taxonomic level at which the network was built.}

\item{g_colors}{Set of colors. The vector must have the same length of g_tax elements.}
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
# Node colors at phylum level
unq<-unique(T_table[,"Phylum"])
colors<-rainbow(length(unq))

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

# Color assignment for the nodes
insect_sparCC<-v_colored(insect_sparCC, T_table, g_tax = "Phylum",
               p_tax = "Genus", g_colors = colors)
plant_sparCC<-v_colored(plant_sparCC, T_table, g_tax = "Phylum", p_tax = "Genus",
                   g_colors = colors)

# Plot networks
plot(insect_sparCC, vertex.label.color="black",
     vertex.color = vertex.attributes(insect_sparCC)$color, vertex.label.cex=.5,
     vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5)
legend(x=-2.7, y=-0.3, unq, title = "Insect", pch=21, pt.bg=colors, pt.cex=2, cex=.8, bty="n", ncol=1)

plot(plant_sparCC, vertex.label.color="black",
     vertex.color = vertex.attributes(plant_sparCC)$color, vertex.label.cex=.5,
     vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5)
legend(x=-2.7, y=-0.3, unq, title = "Plant", pch=21, pt.bg=colors, pt.cex=2, cex=.8, bty="n", ncol=1)
}
