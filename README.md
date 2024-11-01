VisNA
================

**VisNA** is an R package for visualizing and analyzing missing data
patterns, helping users identify missing data mechanisms to improve data
analysis and modeling.

There are three types of missing data mechanisms (Rubin, 1976):

- Missing Completely at Random (MCAR): Missingness is unrelated to any
  data (observed or unobserved). Formal tests, such as Little’s MCAR
  test, and visualization tools, like mosaic plots, are often used to
  detect MCAR (Templ, 2022).

- Missing at Random (MAR): The probability of missingness is related to
  observed data but not to the missing values themselves.

- Missing Not at Random (MNAR): Missingness depends on the unobserved
  data, meaning that the missing values themselves influence whether
  they are missing.

The detection of missing data mechanisms incurs appropriate handling
strategies, such as imputation methods, to avoid bias and improve the
quality of the analysis. In practice, MCAR is rare, with most missing
data mechanisms falling under MAR or MNAR. **VisNA** is particularly
helpful in visualizing missing patterns and assisting in identifying
these two common mechanisms, making it a valuable tool in the
preprocessing and analysis of incomplete datasets.

## Installation

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

## References

Rubin, D. B. (1976). Inference and missing data. Biometrika, 63(3),
581-592.

Templ, M. (2022). Missing Data. In Handbook of Computational Statistics
(pp. 1-30). Springer, Cham.

## Contribution

We welcome contributions! Feel free to open a pull request or submit
issues.

## License

Licensed under the MIT License.
