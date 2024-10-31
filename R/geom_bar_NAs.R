#' Create a Bar Plot of Missing Values Counts
#'
#' `geom_bar_NAs` generates a bar plot showing the count of missing values for
#' two input variables.
#'
#' @param var1 A vector, data frame column, or similar object to be evaluated for missing values.
#' @param var2 A vector, data frame column, or similar object to be evaluated for missing values.
#' @param fill A character string specifying the fill color for the bars. Defaults to `"#FF6F91"`.
#' @param scale Numeric value to set the upper limit of the y-axis. If `NULL`, the scale is set
#' to the maximum count between `var1` and `var2`.
#'
#' @return A ggplot object showing a bar plot with missing value counts for `var1` and `var2`.
#'
#' @examples
#' # Example usage with dummy data
#' var1 <- c(1, 2, NA, 4, NA)
#' var2 <- c(NA, 2, NA, 4, 5)
#' geom_bar_NAs(var1, var2)
#'
#' @import ggplot2
#' @export
geom_bar_NAs <- function(var1, var2, fill = "#FF6F91", scale = NULL) {

  # Prepare plot data
  var1_missing_count <- sum(is.na(var1))
  var2_missing_count <- sum(is.na(var2))
  plot_data <- data.frame(variable = c("var1", "var2"), count = c(var1_missing_count, var2_missing_count))

  if (is.null(scale)) {
    scale <- max(plot_data$count)
  }

  # Create the bar plot
  p <- ggplot(plot_data, aes(x = variable, y = count, fill = variable)) +
    geom_bar(stat = "identity", fill = fill) +
    scale_y_continuous(limits = c(0, scale))

  return(p)
}
