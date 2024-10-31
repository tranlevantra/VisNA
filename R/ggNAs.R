#' Visualize Missing Data Summary
#'
#' `ggNAs` generates a summary plot of missing data for each variable in a dataset. Users can
#' visualize overall missing values or, if a response variable is specified, missing values by
#' groups within the response variable.
#'
#' @param data A data frame containing the variables to be analyzed for missing values.
#' @param response Optional. A character vector specifying one or more response variables for
#' grouping. If `NULL`, the plot shows overall missing data counts without grouping.
#' @param ncol Integer. The number of columns to use in the facetted plot layout.
#' Defaults to `2`.
#'
#' @return A ggplot object showing a bar plot of missing data counts for each variable, either
#' overall or grouped by response levels. If a response variable is specified, missing values
#' for each response level are displayed in separate facets.
#'
#' @details
#' - **No Response Specified**: When `response = NULL`, the plot shows the total count of
#' missing and non-missing values for each variable.
#' - **With Response**: When a response variable is provided, the plot shows the count of
#' missing values grouped by levels of the response variable, with facets for each group.
#'
#' @examples
#' # Example usage with dummy data
#' data <- data.frame(
#'   var1 = c(1, 2, NA, 4, NA),
#'   var2 = c(NA, 2, NA, 4, 5),
#'   var3 = c(1, NA, 3, 4, 5),
#'   response = factor(c("A", "B", "A", "A", "B"))
#' )
#'
#' # Overall missing data summary
#' ggNAs(data)
#'
#' # Missing data summary by response variable, customized with 3 facets on each row
#' ggNAs(data, response = "response", ncol = 3)
#'
#' @import dplyr
#' @import tidyr
#' @import ggplot2
#' @importFrom stringr str_c
#' @importFrom purrr map_chr
#' @export
ggNAs <- function(data, response = NULL, ncol = 2) {

  # If no response is specified, plot overall NA counts
  if (is.null(response)) {

    # Prepare data for plotting
    plot_data <- data %>%
      summarise(across(everything(), ~ sum(is.na(.)))) %>%
      pivot_longer(
        cols = everything(),
        names_to = "variable",
        values_to = "na"
      ) %>%
      mutate(not_na = nrow(data) - na) %>%
      pivot_longer(
        cols = c(na, not_na),
        names_to = "fill",
        values_to = "count"
      ) %>%
      mutate(fill = factor(fill, levels = c("not_na", "na")))

    # Generate the plot
    return(
      ggplot(plot_data, aes(x = count, y = variable, fill = fill)) +
        geom_bar(stat = "identity", position = "stack") +
        labs(title = "Missing Data Summary")
    )
  }

  # If a response is specified, calculate NA counts by response levels
  predictors <- setdiff(names(data), response)
  # Prepare data for plotting
  plot_data <- data %>%
    group_by(across(all_of(response))) %>%
    summarise(
      across(all_of(predictors), ~ sum(is.na(.)), .names = "{col}"),
      total = n(),
      .groups = "drop"
    ) %>%
    # Create a label for facet based on response variable's values
    rowwise() %>%
    mutate(
      facet = str_c(
        response, " = ",
        map_chr(response, ~ {
          value <- get(.)
          if (is.na(value)) {
            "NA"
          } else {
            as.character(value)
          }
        }),
        collapse = ", "
      )
    ) %>%
    ungroup() %>%
    # Reshape data for plotting
    select(-all_of(response)) %>%
    pivot_longer(
      cols = -c(total, facet),
      names_to = "variable",
      values_to = "na"
    ) %>%
    mutate(
      not_na = total - na,
      percent = na / total * 100
    ) %>%
    pivot_longer(
      cols = c(na, not_na),
      names_to = "fill",
      values_to = "count"
    ) %>%
    mutate(
      fill = factor(fill, levels = c("not_na", "na")),
      scaled_percent = percent / 100 * max(count)
    )

  # Generate the plot for data with response variable
  ggplot(plot_data, aes(x = count, y = variable, fill = fill)) +
    geom_bar(stat = "identity", position = "stack") +
    geom_point(aes(x = scaled_percent), shape = 17) +
    scale_x_continuous(
      sec.axis = sec_axis(
        ~ . * 100 / max(plot_data$count),
        name = "▲ = NA Percentage",
      )
    ) +
    labs(title = "Missing Data Summary by Response Levels") +
    facet_wrap(~facet, scales = "fixed", ncol = ncol)
}

