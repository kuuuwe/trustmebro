#' report invalid birthday and -month components of strings
#'
#' @param data a dataframe or tibble 
#' @param code a string variable containing a SGIC
#' @param start start position of birthdate
#' @param end en position of birthdate
#'
#' @return a tibble containing only SGICs with invalid birthdates
#' @export
#' @import dplyr
#' @examples
#' 
#' # student data
#' data <- tibble(
#' code = c("APE1601", "TBG3568", "DFR2508")
#' )
#' 
#' # report invalid birthdaymonths in code
#' invalid_birthdaymonths <- report_invalid_birthdaymonth(data, "code", 6, 7)
#' 
#' # show results
#' print(invalid_birthdaymonths)
#' 
report_invalid_birthdaymonth <- function(data, code, start, end) {
  # inspect birthdate
  data <- data %>%
    mutate(birthdaymonth_valid = inspect_birthdaymonth(!!sym(code), start, end))
  
  # extract invalid birthdate
  invalid_birthdaymonths <- data %>%
    filter(birthdaymonth_valid == FALSE) %>%
    select(code)
  
  return(invalid_birthdaymonths)
}