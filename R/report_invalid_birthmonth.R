#' report invalid birthmonth components of strings
#'
#' @param data a dataframe or tibble 
#' @param code a string variable containing a SGIC
#' @param start start position of birthmonth
#' @param end en position of birthmonth
#'
#' @return a tibble containing only SGICs with invalid birthmonth
#' @export
#' @import dplyr
#' @import tibble
#' @examples
#' 
#' # student data
#' data <- tibble::tibble(
#' code = c("APE1601", "TBG3568", "DFR2508")
#' )
#' 
#' # report invalid birthmonths in code
#' invalid_birthmonths <- report_invalid_birthmonth(data, "code", 6, 7)
#' 
#' # show results
#' print(invalid_birthmonths)
#' 
report_invalid_birthmonth <- function(data, code, start, end) {
  # inspect birthmonth
  data <- data %>%
    mutate(birthmonth_valid = inspect_birthmonth(!!sym(code), start, end))
  
  # extract invalid birthmonths
  invalid_birthmonths <- data %>%
    filter(birthmonth_valid == FALSE) %>%
    select(code)
  
  return(invalid_birthmonths)
}