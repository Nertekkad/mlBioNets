\name{diff_nodes_graph}
\alias{diff_nodes_graph}
\title{diff_nodes_graph}
\usage{
diff_nodes_graph(T_Collapsed, n, mat_list, g.list, alpha)
}
\description{
Identifies the most abundant taxa and recognizes which nodes have significant differences between their abundances (red) and which ones don't (blue).
}
\arguments{
\item{T_collapsed}{Abundance table collapsed at a certain taxonomic level.}

\item{n}{Number of nodes to considere.}

\item{mat_list}{List of abundance matrices.}

\item{g.list}{List of \emph{igraph} objects.}

\item{alpha}{Significance. It must be a number between 0 and 1.}
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

# Nodes' abundence differences between layers
mat_list<-list(Insectmat, Plantmat)
g.list<-list(insect_sparCC, plant_sparCC)
# We'll considere only the 20 nodes more important according to the abundances.
diff_g<-diff_nodes_graph(T_Collapsed, n = 20, mat_list, g.list, alpha = 0.05)

plot(diff_g, vertex.label.color="black", vertex.color = vertex.attributes(diff_g)$colorA,
     vertex.label.cex=.5, vertex.label.dist=1,layout=layout_with_kk, vertex.size = 5)
}
