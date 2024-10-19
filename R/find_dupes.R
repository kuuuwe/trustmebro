#' Identify duplicate cases
#'
#' @description
#' Identify duplicate cases in a data frame or tibble based on specific variables.
#' A logical column `has_dupes` is added, that indicates whether or not a row has duplicate values based on the provided variables.
#' 
#' @param data A data frame or tibble 
#' @param ... Variable names to check for duplicates
#'
#' @return The original data frame or tibble with an additional logical column 'has_dupes'
#' which is `TRUE` for rows that have duplicates based on the specified variables and `FALSE` otherwise.
#' 
#' @export
#'
#' @examples
#' # Example data
#' print(sailor_students)
#' 
#' # Find duplicate cases based on 'sgic', 'school' and 'class'
#' sailor_students_dupes <- find_dupes(sailor_students, sgic, school, class)
#' 
#' # Rows where 'has_dupes' is TRUE indicate duplicates based on the provided columns
#' print(sailor_students_dupes)
find_dupes <- function(data, ...) {
  data <- data %>%
    group_by(...) %>%
    mutate(has_dupes = n() > 1) %>%
    ungroup()
  
  return(data)
}
