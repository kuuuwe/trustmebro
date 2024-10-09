#' Inspect data for duplicate cases based on specified variables
#'
#' @param data A data frame / tibble containing the data to be inspected
#' @param ... variable names to check for duplicates
#'
#' @return The original data frame with an additional logical column 'has_dupes'
#' @export
#'
#' @examples
#' print(sailor_students)
#' sailor_students_dupes <- find_dupes(sailor_students, sgic, school, class)
#' print(sailor_students_dupes)
find_dupes <- function(data, ...) {
  data <- data %>%
    group_by(...) %>%
    mutate(has_dupes = n() > 1) %>%
    ungroup()
  
  return(data)
}
