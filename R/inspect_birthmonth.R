#' inspect if a string contains only one number-component which represents a valid birthmonth
#'
#'@description
#'This function checks if a string contains only one number-component which represents a valid birthmonth
#'
#' @param code a string containing the SGIC
#'
#' @return a logical value `TRUE` if the string contains only one valid birthmonth-component, otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthmonth("DEF02") # TRUE
#' inspect_birthmonth("GHI33") # FALSE
inspect_birthmonth <- function(code) {
  
  # ist das ein string?
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # Funktion zum Prüfen eines Strings
  check_string <- function(c) {
    # Suche nach allen Blöcken von aufeinanderfolgenden Ziffern
    matches <- regmatches(c, gregexpr("\\d+", c))[[1]]
    
    # Finde den ersten Block mit genau 2 Ziffern
    match <- matches[nchar(matches) == 2]
    
    # Prüfe, ob genau ein Block von 2 Ziffern gefunden wurde
    if (length(match) != 1) {
      return(FALSE)
    }
    
    # Tag extrahieren und überprüfen
    month <- as.numeric(match)
    valid_month <- !is.na(month) & month >= 1 & month <= 12
    
    return(valid_month)
  }
  
  # Überprüfe jedes Elements im Vektor
  result <- sapply(code, check_string)
  names(result) <- NULL
  
  return(result)
}