#' Inspect birthmonth-component of a string
#'
#'@description
#' Check whether a given string contains exactly one two-digit number that represents a valid month of the year (between 01 and 12). 
#' The string is assumed to be a code (e.g., a SGIC), which may include letters and digits.
#' 
#' @param code A character string containing a SGIC or similar code that may include a numeric birthmonth-component.
#'
#' @return A logical value: `TRUE` if the string contains only one valid birthmonth-component (between 01 and 12), otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthday("DEF66") # FALSE - 66 is not a valid month
#' inspect_birthday("GHI02") # TRUE - 02 (February) is a valid month
#' inspect_birthday("ABC12DEF10") # FALSE - Multiple numeric components
#' inspect_birthday("XYZ") # FALSE - No numeric component
#' inspect_birthday("JKL11") # TRUE - 11 (November) is a valid day
inspect_birthmonth <- function(code) {
  
  # check if input is a character
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # function for checking valid birthmonth
  check_string <- function(c) {
    # identify number components
    matches <- regmatches(c, gregexpr("\\d+", c))[[1]]
    
    # identify blocks of numbers containing 2 digits
    match <- matches[nchar(matches) == 2]
    
    # check if only one number component is present
    if (length(match) != 1) {
      return(FALSE)
    }
    
    # extract month and check if month is valid
    month <- as.numeric(match)
    valid_month <- !is.na(month) & month >= 1 & month <= 12
    
    return(valid_month)
  }
  
  # check every element in vector
  result <- sapply(code, check_string)
  names(result) <- NULL
  
  return(result)
}