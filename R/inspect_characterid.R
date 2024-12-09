#' Inspect if a string matches an expected pattern
#' 
#'@description
#' Check whether a given string matches a specified pattern using regular expressions (regex). 
#' The string is assumed to be a code (e.g., a SGIC), which should follow a predefined format.
#'
#' @param code A character string containing a SGIC or similar code that should follow a predefined format.
#' @param pattern A character string specifying the expected pattern using regular expressions (regex). 
#'        The pattern defines the format `code` should match.
#'        
#' @return A logical value: `TRUE` if the code matches the expected pattern, otherwise `FALSE`
#' @export
#'
#' @examples
#' inspect_characterid("ABC1234", "^[A-Za-z]{3}[0-9]{4}$") #TRUE - Matches the pattern
#' inspect_characterid("12DBG45FG", "^[A-Za-z]{3}[0-9]{4}$") #FALSE - Does not match the pattern

inspect_characterid <- function(code, pattern) {
  # is code a string
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # does code match pattern
  matches_pattern <- grepl(pattern, code)
  
  return(matches_pattern)
}
