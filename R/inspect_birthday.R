#' inspect birthday component of a string
#'
#'@description
#'This function checks if a substring of a given code represents a valid birthday in the code
#'
#' @param code a string containing the SGIC
#'
#' @return a logical value `TRUE` if the substring represents a valid birthday, otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthday("DEF2802") # TRUE
#' inspect_birthday("GHI6702") # FALSE
inspect_birthday <- function(code) {
  
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
    day <- as.numeric(match)
    valid_day <- !is.na(day) & day >= 1 & day <= 31
    
    return(valid_day)
  }
  
  # Überprüfe jedes Elements im Vektor
  result <- sapply(code, check_string)
  names(result) <- NULL
  
  return(result)
}