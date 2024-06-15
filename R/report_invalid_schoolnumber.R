#' report invalid schoolnumbers
#'
#' @param data a dataframe or tibble 
#' @param schoolnumber a numeric value
#' @param expected_length expected length of the numeric value
#'
#' @return a tibble containing only schoolnumbers not equal to the expected length
#' @export
#' @import dplyr tibble
#' 
#' @examples
#' 
#' # schoolnumbers
#' data <- tibble::tibble(
#' schoolnumber = c(12345, 54321, 123)
#' )
#' 
#' # report invalid schoolnumbers
#' invalid_schoolnumbers <- report_invalid_schoolnumber(data, "schoolnumber", 5)
#' 
#' # show results
#' print(invalid_schoolnumbers)
#' 
report_invalid_schoolnumber <- function(data, schoolnumber, expected_length) {
  # inspect schoolnumbers
  data <- data %>%
    mutate(schoolnumber_Valid = inspect_schoolnumber(!!sym(schoolnumber), expected_length))
  
  # extract invalid schoolnumbers
  invalid_schoolnumbers <- data %>%
    filter(schoolnumber_Valid == FALSE) %>%
    select(schoolnumber)
  
  return(invalid_schoolnumbers)
}