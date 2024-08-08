#' inspect birthday and -month component of a string
#'
#'@description
#'This function checks if a substring of a given code represents a valid birthdate in the code
#'
#' @param code a string containing the SGIC
#'
#' @return a logical value `TRUE` if the substring represents a valid date, otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthdaymonth("DEF2802") # TRUE
#' inspect_birthdaymonth("GHI3002") # FALSE
#' 
inspect_birthdaymonth <- function(code) {
  
  # Überprüfen, ob code ein Vektor von Zeichenketten ist
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # Funktion zum Prüfen eines einzelnen Strings
  check_string <- function(c) {
    # Suche nach einem Block von aufeinanderfolgenden Ziffern
    match <- regmatches(c, gregexpr("\\d+", c))[[1]]
    
    # Prüfen, ob genau ein Block von 4 Ziffern gefunden wurde
    if (length(match) != 1 || nchar(match) != 4) {
      return(FALSE)
    }
    
    # Block der Ziffern extrahieren
    date_part <- match
    
    # Tag und Monat extrahieren
    day <- as.numeric(substr(date_part, 1, 2))
    month <- as.numeric(substr(date_part, 3, 4))
    
    # Überprüfen, ob Monat gültig ist
    if (is.na(month) || month < 1 || month > 12) {
      return(FALSE)
    }
    
    # Anzahl der Tage in jedem Monat
    days_in_month <- c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
    
    # Überprüfen, ob Tag gültig ist
    valid_day <- day >= 1 & day <= days_in_month[month]
    
    return(valid_day)
  }
  
  # Überprüfen jedes Elements im Vektor
  result <- sapply(code, check_string, USE.NAMES = FALSE)
  
  return(result)
}