VisNA
================

**VisNA** is an R package designed to visualise and analyse missing data
patterns, aiding users in understanding the reasons behind missing data
to enhance data analysis and modeling.

The package identifies three key types of missing data according to
Rubin (1976):

- *Missing Completely at Random (MCAR)*: Data is missing without
  relation to any other data.

- *Missing at Random (MAR)*: Missing data correlates with visible data
  but not with the missing data itself.

- *Missing Not at Random (MNAR)*: Missing data is linked to unseen
  aspects of the data.

Statistical tests like Little’s MCAR can be complex and only confirm the
presence of missing data mechanisms without pinpointing specific
locations. In contrast, **VisNA** enhances existing visualisation tools
by clearly highlighting these patterns, especially aiding in
distinguishing between MAR and MNAR. This makes it an essential tool for
analysing incomplete datasets.

## Installation

You can install the development version of **VisNA** from GitHub with:

``` r
if (!require("devtools")) install.packages("devtools")

#Install
devtools::install_github("tranlevantra/VisNA")

#Load
library(VisNA)
```

## Usage

Please find in this
[vignette](https://tranlevantra.github.io/VisNA/vignettes.html) a
detailed guide on how to use the package.

## Acknowledgements

VisNA was developed as part of my WIL course at RMIT University. I
deeply appreciate the guidance of Prof. Irene Hudson and A. Prof. Yan
Wang. Their focus on understanding the mechanisms behind missing data
before considering any imputation set the foundation for this package.

Special thanks to [Asma Ali](https://github.com/AsmaLi1326) for her
insightful feedback on design and her unwavering emotional support
throughout this project.

## References

Rubin, D. B. (1976). Inference and missing data. *Biometrika*, 63(3),
581–592. <https://doi.org/10.1093/biomet/63.3.581>

Templ, M. (2023). *Visualization and Imputation of Missing Values: With
Applications in R* (1st ed.). Springer International Publishing AG.
<https://doi.org/10.1007/978-3-031-30073-8>

H. Wickham. *ggplot2: Elegant Graphics for Data Analysis*.
Springer-Verlag New York, 2016.

Schloerke B, Cook D, Larmarange J, Briatte F, Marbach M, Thoen E, Elberg
A, Crowley J (2024). *GGally: Extension to ‘ggplot2’*. R package version
2.2.1, <https://CRAN.R-project.org/package=GGally>.

## Contribution

Feel free to open a pull request or submit issues. I am always open to
feedback and suggestions for improvement.

## License

Licensed under the MIT License.
