#' Inspect birthday-component of a string
#'
#'@description
#' Check whether a given string contains exactly one two-digit number that represents a valid day of the month (between 01 and 31). 
#' The string is assumed to be a code (e.g., a SGIC), which may include letters and digits.
#' 
#' @param code A character string containing a SGIC or similar code that may include a numeric birthday-component.
#'
#' @return A logical value: `TRUE` if the string contains only one valid birthday-component (between 01 and 31), otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthday("DEF66") # FALSE - 66 is not a valid day
#' inspect_birthday("GHI02") # TRUE - 02 is a valid day
#' inspect_birthday("ABC12DEF34") # FALSE - Multiple numeric components
#' inspect_birthday("XYZ") # FALSE - No numeric component
#' inspect_birthday("JKL31") # TRUE - 31 is a valid day
inspect_birthday <- function(code) {
  
  # check if input is a character
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # function for checking input
  check_string <- function(c) {
    # identify numbers
    matches <- regmatches(c, gregexpr("\\d+", c))[[1]]
    
    # get first block with 2 numbers
    match <- matches[nchar(matches) == 2]
    
    # check if there is only one block with 2 numbers
    if (length(match) != 1) {
      return(FALSE)
    }
    
    # check if number is a valid birthday
    day <- as.numeric(match)
    valid_day <- !is.na(day) & day >= 1 & day <= 31
    
    return(valid_day)
  }
  
  # check every vector element
  result <- sapply(code, check_string)
  names(result) <- NULL
  
  return(result)
}