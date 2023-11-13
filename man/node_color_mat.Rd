\name{node_color_mat}
\alias{node_color_mat}
\title{node_color_mat}
\usage{
node_color_mat(g.list, type)
}
\description{
Create a matrix that contains the assigned colors for the nodes of a multilayer network.
}
\arguments{
\item{g.list}{List of \emph{igraph} objects.}

\item{type}{"phylo" assigns the colors according to a certain taxonomic level. "centrality" assings the colors according to the centrality level.}
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

# Plot multilayer network
library(muxViz)
g.list<-list(insect_sparCC, plant_sparCC)
g.list<-ctr_ml(g.list, ctr_type = "degree")
abs_IP<-list(Insectmat, Plantmat)
lay <- layoutMultiplex(g.list, layout="kk", ggplot.format=F, box=T)
# Centrality
plot_multiplex3D(g.list, layer.layout=lay,
                 layer.colors=c("red3", "green3"),
                 layer.shift.x=0.5, layer.space=2,
                 layer.labels=NULL, layer.labels.cex=1.5,
                 node.size.values="auto",
                 node.size.scale=abs_mat(abs_IP, g.list, 20),
                 node.colors=node_color_mat(g.list, "centrality"),
                 edge.colors="#838B8B",
                 node.colors.aggr=NULL,
                 show.aggregate=F)
# Phylo
unq<-unique(T_table[,"Phylum"])
colors<-rainbow(length(unq))
v_colored_ml(g.list, T_table, g_tax = "Phylum", p_tax = "Genus",
             g_colors = colors)

plot_multiplex3D(g.list, layer.layout=lay,
                 layer.colors=c("red3", "green3"),
                 layer.shift.x=0.5, layer.space=2,
                 layer.labels=NULL, layer.labels.cex=1.5,
                 node.size.values="auto",
                 node.size.scale=abs_mat(abs_IP, g.list, 20),
                 node.colors=node_color_mat(g.list, "phylo"),
                 edge.colors="#838B8B",
                 node.colors.aggr=NULL,
                 show.aggregate=F)
}

