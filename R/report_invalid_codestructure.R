#' report invalid code structure
#'
#' @param data a dataframe or tibble 
#' @param code a string containing a SGIC
#' @param pattern an expected pattern / regex
#'
#' @return a tibble containing only SGICs with incalid code structure
#' @export
#' @import dplyr
#'
#' @examples

#' # student data
#' data <- tibble(
#' code = c("AE1601", "TBG368", "DFR2508")
#' )
#' 
#' # report invalid code structure
#' invalid_codestructures <- report_invalid_codestructure(data, "code", "^[A-Za-z]{3}[0-9]{4}$")
#' 
#' # show results
#' print(invalid_codestructures)

report_invalid_codestructure <- function(data, code, pattern) {
  # inspect schoolnumbers
  data <- data %>%
    mutate(codestructure_valid = inspect_codestructure(!!sym(code), pattern))
  
  # extract invalid schoolnumbers
  invalid_codestructure <- data %>%
    filter(codestructure_valid == FALSE) %>%
    select(!!sym(code))
  
  return(invalid_codestructure)
}