#' inspect borhtday and month components of a SGIC
#'
#' @param code SGIC
#' @param start start index of birthday and birthmonth
#' @param end  end index of birthday and birthmonth
#'
#' @return Boolean 
#' @export
#'
#' @examples
inspect_birthday <- function(code, start, end) {
  # zu prüfenden Bereich extrahieren
  code_snippet <- substr(code, start, end)
  
  # muster suchen
  pattern <- "\\d{1,2}/\\d{1,2}"  # Format: TT/MM
  matches <- grepl(pattern, code_snippet)
  
  # überprüfen, ob muster gefunden wurde
  if (any(matches)) {
    # datum extrahieren
    date_string <- as.character(regmatches(code_snippet, pattern)[[1]])
    
    # datumsteile auf gültigkeit prüfen
    day <- as.numeric(strsplit(date_string, "/")[[1]])
    month <- as.numeric(strsplit(date_string, "/")[[2]])
    
    # gültige wertebereiche für tag und monat
    valid_day_range <- 1:31
    valid_month_range <- 1:12
    
    # gültigkeit prüfen und T oder F zurückgeben
    if (is.numeric(day) & is.numeric(month) & 
        day %in% valid_day_range & month %in% valid_month_range) {
      return(TRUE)
    } else {
      return(FALSE)
    }
  } else {
    # kein muster gefunden
    return(FALSE)
  }
}