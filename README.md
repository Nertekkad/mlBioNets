
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mlBioNets

<!-- badges: start -->

[![GitHub
issues](https://img.shields.io/github/issues/Nertekkad/mlBioNets)](https://github.com/Nertekkad/mlBioNets/issues)
[![GitHub
pulls](https://img.shields.io/github/issues-pr/Nertekkad/mlBioNets)](https://github.com/Nertekkad/mlBioNets/pulls)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

**\*\*mlBionets\*\*** is an R package designed to comprehensively
analyze microbiota data using a multilayer network approach. This
package enables researchers to integrate and analyze multiple types of
biological data, providing a robust framework for studying complex
microbial communities and their interactions within different
environmental and biological contexts.

**Features**

- **Multilayer Network Construction:** Build and visualize multilayer
  networks from microbiota data, incorporating various layers such as
  phylogenetic, functional, and environmental information.

- **Data Integration:** Seamlessly integrate different types of
  microbiota data, including taxonomic profiles and metadata

- **Advanced Analysis Tools:** Perform network-based analyses, including
  community detection, network centrality, and inter-layer connectivity.

- **Visualization:** Generate publication-quality visualizations to
  illustrate complex network structures and interactions.

- **Customizable Workflows:** Easily customize analysis workflows to
  suit specific research needs, facilitating reproducible and flexible
  data analysis.

## Installation instructions

You can install the development version of mlBioNets like so:

``` r
devtools::install_github("Nertekkad/mlBioNets")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo Nertekkad/mlBioNets@HEAD
#> Installing package into '/tmp/RtmpVnAc2t/temp_libpathade7328186c1'
#> (as 'lib' is unspecified)
```

## Citation

Below is the citation output from using `citation('mlBioNets')` in R.
Please run this yourself to check for any updates on how to cite
**mlBioNets**.

``` r
print(citation('mlBioNets'), bibtex = TRUE)
#> To cite package 'mlBioNets' in publications use:
#> 
#>   Lázaro V, Hernández-Zendejas V, Vázquez-Suárez K, Álvarez-Martínez R
#>   (2025). _mlBioNets: R package for the analysis of microbiota data
#>   using a multilayer networks approach_. R package version 0.1.0,
#>   commit f0d5bd3400bf2a555fbeee3cb86354e31156c67a,
#>   <https://github.com/Nertekkad/mlBioNets>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {mlBioNets: R package for the analysis of microbiota data using a multilayer
#> networks approach},
#>     author = {Victor Lázaro and Valeria Hernández-Zendejas and Karel Vázquez-Suárez and Roberto Álvarez-Martínez},
#>     year = {2025},
#>     note = {R package version 0.1.0, commit f0d5bd3400bf2a555fbeee3cb86354e31156c67a},
#>     url = {https://github.com/Nertekkad/mlBioNets},
#>   }
#> 
#> ATTENTION: This citation information has been auto-generated from the
#> package DESCRIPTION file and may need manual editing, see
#> 'help("citation")'.
```

Please note that the `mlBioNets` was only made possible thanks to many
other R and bioinformatics software authors, which are cited either in
the vignettes and/or the paper(s) describing this package.

## Code of Conduct

Please note that the `mlBioNets` project is released with a [Contributor
Code of Conduct](http://bioconductor.org/about/code-of-conduct/). By
contributing to this project, you agree to abide by its terms.
