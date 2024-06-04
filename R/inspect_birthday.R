#' inspect birthday component of a string
#'
#'@description
#'This function checks if a substring of a given code represents a valid birthday in the code
#'
#' @param code a string containing the SGIC
#' @param start start position of birthday
#' @param end end position of birthday
#'
#' @return a logical value `TRUE` if the substring represents a valid birthday, otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthday("DEF2802", 4, 5) # TRUE
#' inspect_birthday("GHI6702", 4, 5) # FALSE
inspect_birthday <- function(code, start, end) {
  
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
  day <- as.numeric(substr(date_part, 1, 2))

  # Ist der Tag in dem Monat gültig?
  if (day < 1 | day > 31) {
    return(FALSE)
  }
  
  return(TRUE)
}
