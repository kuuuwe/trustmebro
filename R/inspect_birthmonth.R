#' inspect birthmonth component of a string
#'
#'@description
#'This function checks if a substring of a given code represents a valid birthmonth in the code
#'
#' @param code a string containing the SGIC
#' @param start start position of birthmonth
#' @param end end position of birthmonth
#'
#' @return a logical value `TRUE` if the substring represents a valid birthmonth, otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthmonth("DEF2802", 6, 7) # TRUE
#' inspect_birthmonth("GHI3033", 6, 7) # FALSE
inspect_birthmonth <- function(code, start, end) {
  #ist das ein string?
  if (!is.character(code) | length(code) != 1) {
    stop("invalid input: code must be a string")
  }
  
  # sind start und end gültig?
  if (start < 1 | end > nchar(code) | start > end) {
    stop("invalid input: start and/or end position")
  }
  
  #zeichen extrahieren
  date_part <- substr(code, start, end)
  
  # sind zeichen 2 zeichen lang und zahlen?
  if (nchar(date_part) != 2 | !grepl("^\\d{2}$", date_part)) {
    return(FALSE)
  }
  
  # Tag und Monat raussuchen
  month <- as.numeric(substr(date_part, 1, 2))
  
  # Ist Monat gültig?
  if (month < 1 | month > 12) {
    return(FALSE)
  }
  
  return(TRUE)
}