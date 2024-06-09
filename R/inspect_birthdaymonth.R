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
  
  # Ist code ein Vektor von Zeichenketten?
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # Sind start und end gültige Positionen?
  if (start < 1 | end > max(nchar(code)) | start > end) {
    stop("invalid input: start and/or end position")
  }
  
  # Zeichen extrahieren
  date_part <- substr(code, start, end)
  
  # Sind Zeichen 4 Zeichen lang und Zahlen?
  valid_date_part <- nchar(date_part) == 4 & grepl("^\\d{4}$", date_part)
  
  # Tag und Monat extrahieren
  day <- as.numeric(substr(date_part, 1, 2))
  month <- as.numeric(substr(date_part, 3, 4))
  
  # Überprüfen, ob Monat gültig ist
  valid_month <- !is.na(month) & month >= 1 & month <= 12
  
  # Anzahl der Tage in jedem Monat
  days_in_month <- c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
  
  # Gültigkeit der Tage prüfen
  valid_day <- mapply(function(d, m) {
    if (is.na(m) | m < 1 | m > 12) {
      return(FALSE)
    }
    return(d >= 1 & d <= days_in_month[m])
  }, day, month)
  
  # Rückgabe eines logischen Vektors, der die Gültigkeit anzeigt
  return(valid_date_part & valid_day & valid_month)
}