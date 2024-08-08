#' report strings with invalid birthday entries
#'
#' @param data a dataframe or tibble 
#' @param code a string variable containing a SGIC
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
#' invalid_birthdays <- report_invalid_birthday(data, "code")
#' 
#' # show results
#' print(invalid_birthdays)
#' 
report_invalid_birthday <- function(data, code) {
  birthday_Valid <- NULL
  # inspect birthdays
  data <- data %>%
    mutate(birthday_Valid = inspect_birthday(!!sym(code)))
  
  # extract invalid birthdays
  invalid_birthdays <- data %>%
    filter(birthday_Valid == FALSE) %>%
    select(code)
  
  return(invalid_birthdays)
}