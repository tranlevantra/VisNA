% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_bar_NAs.R
\name{geom_bar_NAs}
\alias{geom_bar_NAs}
\title{Create a Bar Plot of Missing Values Counts}
\usage{
geom_bar_NAs(var1, var2, fill = "#FF6F91", scale = NULL)
}
\arguments{
\item{var1}{A vector, data frame column, or similar object to be evaluated for missing values.}

\item{var2}{A vector, data frame column, or similar object to be evaluated for missing values.}

\item{fill}{A character string specifying the fill color for the bars. Defaults to `"#FF6F91"`.}

\item{scale}{Numeric value to set the upper limit of the y-axis. If `NULL`, the scale is set
to the maximum count between `var1` and `var2`.}
}
\value{
A ggplot object showing a bar plot with missing value counts for `var1` and `var2`.
}
\description{
`geom_bar_NAs` generates a bar plot showing the count of missing values for
two input variables.
}
\examples{
# Example usage with dummy data
var1 <- c(1, 2, NA, 4, NA)
var2 <- c(NA, 2, NA, 4, 5)
geom_bar_NAs(var1, var2)

}
