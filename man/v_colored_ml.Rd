% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/v_colored_ml.R
\name{v_colored_ml}
\alias{v_colored_ml}
\title{v_colored_ml}
\usage{
v_colored_ml (g.list, T_table, g_tax, p_tax, g_colors)
}
\arguments{
\item{g.list}{List of igraph objects (multilayer network).}

\item{T_table}{Taxa table (as data.frame).}

\item{g_tax}{The taxonomic level at which the nodes will be colored.}

\item{p_tax}{The taxonomic level at which the network was built.}

\item{g_colors}{Set of colors. The vector must have the same length of g_tax elements.}
}
\value{
An igraph object.
}
\description{
Assigns a color to each node of a multilayer network depending of their taxonomic level, for example, the phylum.
}
\examples{

library(seqtime)
# Loads this library to create a vector with colors
library (viridis)

data("mlnet_dstoolAB")

g <- v_colored_ml (g.list = mlnet_dstoolAB, T_table = david_stool_lineages, g_tax = "Order", p_tax = "Genus", g_colors = c)
}
\seealso{
\code{\link[=v_colored]{v_colored()}}
}
