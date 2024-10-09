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