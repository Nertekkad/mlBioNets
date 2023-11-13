\name{T_collapse}
\alias{T_collapse}
\title{T_collapse}
\usage{
T_collapse(T_table, O_table, names_level)
}
\description{
Sums the abundances at a certain taxonomic level.
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
T_Collapsed[1:10,1:5]
}
