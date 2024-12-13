#' Pairwise Plot of Missing Values
#'
#' `ggpairsNAs` creates a matrix of pairwise plots for visualizing missing values across variables in a data frame.
#' The function uses customized upper, lower, and diagonal panels to display missing value counts and relationships.
#'
#' @param data A data frame containing variables to be analyzed for missing values.
#' @param fill A character vector of two colors used to fill the visual elements in the Venn and bar diagrams.
#' Defaults to `c("#01BFC4", "#007a7c")`.
#'
#' @return A `ggpairs` object displaying pairwise plots of missing values for each variable in `data`.
#'
#' @details The function customizes the following:
#' - **Diagonal Panel**: Displays the count of missing values for each variable.
#' - **Lower Panel**: Displays a Venn diagram showing the overlap of missing values between variable pairs.
#' - **Upper Panel**: Shows a bar plot with counts of missing values for each variable.
#'
#' @examples
#' # Example usage with dummy data
#' data <- data.frame(
#'   var1 = c(1, 2, NA, 4, NA),
#'   var2 = c(NA, 2, NA, 4, 5),
#'   var3 = c(1, NA, 3, 4, 5)
#' )
#' ggpairsNAs(data)
#'
#' @import dplyr
#' @import tidyr
#' @import GGally
#' @export
ggpairsNAs <- function(data, fill = c("#01BFC4", "#007a7c")) {

  # Convert character columns to factors
  data <- data.frame(lapply(data, function(x) if(is.character(x)) factor(x) else x))

  # Convert factor columns to numeric
  data <- data.frame(lapply(data, function(x) if(is.factor(x)) as.numeric(x) else x))

  # Diagonal FNC
  diagonal_fnc <- function(data, mapping, ...) {
    var <- as_label(mapping$x)
    var_missing_count <- sum(is.na(data[[var]]))
    ggplot() +
      geom_text(aes(x = 0.5, y = 0.5, label = var_missing_count)) +
      theme_void()
  }

  # Lower FNC
  lower_fn <- function(data, mapping, ...) {
    var1 <- as_label(mapping$x)
    var2 <- as_label(mapping$y)
    geom_venn_NAs(data[[var1]], data[[var2]], fill = fill, cex = 0.0)
  }

  # Upper FNC
  max_missing_count <- max(sapply(data, function(x) sum(is.na(x)))) # Scale for the barplot
  upper_fn <- function(data, mapping, ...) {
    var1 <- as_label(mapping$x)
    var2 <- as_label(mapping$y)
    geom_bar_NAs(data[[var1]], data[[var2]], fill = fill[1], scale = max_missing_count)
  }

  # Main ggpairs configuration
  ggpairs(data, columns = names(data),
          upper = list(continuous = wrap(upper_fn)),
          lower = list(continuous = wrap(lower_fn)),
          diag = list(continuous = wrap(diagonal_fnc))) +
    labs(title = "Pairwise Diagrams for Missing Values")
}
