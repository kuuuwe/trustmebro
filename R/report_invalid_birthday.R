#' report invalid birthday components of strings
#'
#' @param data a dataframe or tibble 
#' @param code a string variable containing a SGIC
#' @param start start position of birthday
#' @param end en position of birthday
#'
#' @return a tibble containing only SGICs with invalid birthdays
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
#' # report invalid birthdays in code
#' invalid_birthdays <- report_invalid_birthday(data, "code", 4, 5)
#' 
#' # show results
#' print(invalid_birthdays)
#' 
report_invalid_birthday <- function(data, code, start, end) {
  birthday_Valid <- NULL
  # inspect birthdays
  data <- data %>%
    mutate(birthday_Valid = inspect_birthday(!!sym(code), start, end))
  
  # extract invalid birthdays
  invalid_birthdays <- data %>%
    filter(birthday_Valid == FALSE) %>%
    select(code)
  
  return(invalid_birthdays)
}