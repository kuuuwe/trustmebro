#' report strings with invalid birthmonth entries
#'
#' @param data a dataframe or tibble 
#' @param code a string variable containing a SGIC
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
#' invalid_birthmonths <- report_invalid_birthmonth(data, "code")
#' 
#' # show results
#' print(invalid_birthmonths)
#' 
report_invalid_birthmonth <- function(data, code) {
  birthmonth_valid <- NULL
  # inspect birthmonth
  data <- data %>%
    mutate(birthmonth_valid = inspect_birthmonth(!!sym(code)))
  
  # extract invalid birthmonths
  invalid_birthmonths <- data %>%
    filter(birthmonth_valid == FALSE) %>%
    select(code)
  
  return(invalid_birthmonths)
}