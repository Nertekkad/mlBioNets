% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/T_collapse.R
\name{T_collapse}
\alias{T_collapse}
\title{Aggregates the abundance data}
\usage{
T_collapse (is_phyloseq=T, ps=..., names_level=...)
}
\arguments{
\item{ps}{If "is_phyloseq = T", a phyloseq object, and "is_phyloseq = F" for data.frame.}

\item{T_table}{(If is_phyloseq = F) A taxa table.}

\item{O_table}{(If is_phyloseq = F) An OTUs/ASV table.}

\item{names_level}{(If is_phyloseq = F) Taxonomic level to group (ex. class, genus).}
}
\value{
Returns a class array matrix at a selected  taxonomic level.
}
\description{
This function aggregates the abundance data at a specified taxonomic level. It accepts a phyloseq object or a data.frame as input.
}
\examples{
# With BiocManager, package "microbiome"
library(microbiome)
# if is_phyloseq = T

library (microbiome)
data ("dietswap")
T_collapse (is_phyloseq = T, ps = dietswap, names_level ="Phylum")

# if is_phyloseq = F

library (seqtime)
colnames (david_stool_lineages)<- c("ID", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species", "Summary", "ID")

T_collapse(is_phyloseq = F, T_table = david_stool_lineages, O_table = david_stoolA_otus, names_level = "Family")
}
