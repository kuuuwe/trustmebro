#' Inspect for duplicate cases based on specified variables
#'
#' @param data A data frame / tibble containing the data to be inspected
#' @param ... variable names to check for duplicates
#'
#' @return The original data frame with an additional logical column 'has_dupes'
#' @export
#'
#' @examples
#' # Example data frame
#' data <- tibble::tibble(
#'   id = 1:5,
#'   name = c("Alice", "Bob", "Alice", "David", "Alice"),
#'   age = c(25, 30, 25, 40, 25)
#' )
#'
#' # Check for duplicates based on 'name' and 'age'
#' result <- inspect_dupes(data, name, age)
#' print(result)
inspect_dupes <- function(data, ...) {
  data <- data %>%
    group_by(...) %>%
    mutate(has_dupes = n() > 1) %>%
    ungroup()
  
  return(data)
}