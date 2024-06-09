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
  
  # Monat extrahieren und überprüfen
  month <- as.numeric(date_part)
  valid_month <- !is.na(month) & month >= 1 & month <= 12
  
  return(valid_date_part & valid_month)
}
