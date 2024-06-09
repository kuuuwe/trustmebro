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
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # Sind start und end gültige Positionen?
  if (start < 1 | end > max(nchar(code)) | start > end) {
    stop("invalid input: start and/or end position")
  }
  
  # Zeichen extrahieren
  date_part <- substr(code, start, end)
  
  # Sind Zeichen 2 Zeichen lang und Zahlen?
  valid_date_part <- nchar(date_part) == 2 & grepl("^\\d{2}$", date_part)
  
  # Tag extrahieren und überprüfen
  day <- as.numeric(date_part)
  valid_day <- !is.na(day) & day >= 1 & day <= 31
  
  return(valid_date_part & valid_day)
}
