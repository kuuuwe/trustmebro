#' duplicate cases based on specified variables
#'
#' @param data a dataframe or tibble 
#' @param ... variable names to check for duplicates
#'
#' @return a tibble containing only duplicate cases
#' @export
#' @import dplyr
#' @import tibble
#'
#' @examples
#' data <- tibble::tibble(
#'   id = 1:6,
#'  name = c("Alice", "Bob", "Alice", "David", "Alice", "Bob"),
#'  age = c(25, 30, 25, 40, 25, 30)
#' )
#'
#' duplicates <- report_dupes(data, name, age)
report_dupes <- function(data, ...) {
  has_dupes <- NULL
  
  #apply inspect dupes
  data <- inspect_dupes(data, ...)
  # filter dupes
  dupes <- data %>%
    filter(has_dupes) %>%
    select(...) %>%
    arrange(...)
  
  return(dupes)
}