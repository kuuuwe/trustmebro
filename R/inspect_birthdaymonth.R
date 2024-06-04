#' inspect birthday and -month component of a string
#'
#'@description
#'This function checks if a substring of a given code represents a valid birthdate in the code
#'
#' @param code a string containing the SGIC
#' @param start start position of birthdate-components
#' @param end end position of birthdate-components
#'
#' @return a logical value `TRUE` if the substring represents a valid date, otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthdaymonth("DEF2802", 4, 7) # TRUE
#' inspect_birthdaymonth("GHI3002", 4, 7) # FALSE
#' 
inspect_birthdaymonth <- function(code, start, end) {
  
  # ist das ein string?
  if (!is.character(code) | length(code) != 1) {
    stop("invalid input: code must be a string")
  }
  
  # sind start und end gültig?
  if (start < 1 | end > nchar(code) | start > end) {
    stop("invalid input: start and/or end position")
  }
  
  #zeichen extrahieren
  date_part <- substr(code, start, end)
  
  # sind zeichen 4 zeichen lang und zahlen?
  if (nchar(date_part) != 4 | !grepl("^\\d{4}$", date_part)) {
    return(FALSE)
  }
  
  # Tag und Monat raussuchen
  day <- as.numeric(substr(date_part, 1, 2))
  month <- as.numeric(substr(date_part, 3, 4))
  
  # Monat gültig? 
  if (month < 1 | month > 12) {
    return(FALSE)
  }
  
  # Wie viele Tage hat welcher Monat maximal?
  days_in_month <- c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
  
  # Ist der Tag in dem Monat gültig?
  if (day < 1 | day > days_in_month[month]) {
    return(FALSE)
  }
  
  return(TRUE)
}
