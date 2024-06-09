#' report invalid number of letters in a string
#'
#' @param data a dataframe or tibble
#' @param code a string variable containing a SGIC
#' @param expected_count expected number of letters
#'
#' @return a tibble containing only SGICs with invalid number of letters
#' @export
#' @import dplyr
#' 
#' @examples
#' 
#' # student data
#' data <- tibble(
#' code = c("APE1601", "TBGR568", "DFR2508")
#' )
#' 
#' # report invalid number of letters in code
#' invalid_letters <- report_invalid_letters(data, "code")
#' 
#' # show results
#' print(invalid_letters)
#' 
#' 
report_invalid_letters <- function(data, code, expected_count) {
  # inspect letters
  data <- data %>%
    mutate(letters_valid = inspect_letters(!!sym(code), expected_count))
  
  # extract invalid number of letters
  invalid_letters <- data %>%
    filter(letters_valid == FALSE) %>%
    select(!!sym(code))
  
  return(invalid_letters)
}