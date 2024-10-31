#' Create a Venn Diagram for Missing Values
#'
#' `geom_venn_NAs` generates a Venn diagram highlighting the overlap of missing values
#' between two input variables.
#'
#' @param var1 A vector or data frame column to be evaluated for missing values.
#' @param var2 A vector or data frame column to be evaluated for missing values.
#' @param fill A character vector of two colors used to fill the individual and intersection sets.
#' Defaults to `c("#FF6F91", "#CC4C6B")`.
#'
#' @return A ggplot object with an overlaid Venn diagram displaying the count of missing values in
#' `var1`, `var2`, and their overlap.
#'
#' @examples
#' # Example usage with dummy data
#' var1 <- c(1, 2, NA, 4, NA)
#' var2 <- c(NA, 2, NA, 4, 5)
#' geom_venn_NAs(var1, var2)
#'
#' @import ggplot2
#' @importFrom VennDiagram draw.pairwise.venn
#' @export
geom_venn_NAs <- function(var1, var2, fill = c("#FF6F91", "#CC4C6B"), ...) {

  p <- ggplot2::ggplot()

  # Prepare plot data
  var1_missing_count <- sum(is.na(var1))
  var2_missing_count <- sum(is.na(var2))
  overlap_missing <- sum(is.na(var1) & is.na(var2))

  # When both variables have missing values
  if (var1_missing_count != 0 && var2_missing_count != 0) {
    # Set up the Venn diagram
    venn.plot <- VennDiagram::draw.pairwise.venn(
      area1 = var1_missing_count,
      area2 = var2_missing_count,
      cross.area = overlap_missing,
      fill = fill[1],     # Colors for the individual sets
      col = fill[2],      # Color for the intersection
      lty = "blank",
      ext.line.lty = "blank",
      ...
    )
    # Add the Venn diagram to the plot
    p <- p + ggplot2::annotation_custom(grid::grobTree(venn.plot))
  }

  return(p)
}
