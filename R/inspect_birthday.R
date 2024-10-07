#' inspect if a string contains only one number-component which represents a valid birthday
#'
#'@description
#'This function checks if a string contains only one number-component which represents a valid birthday
#'
#' @param code a string containing the SGIC
#'
#' @return a logical value `TRUE` if the string contains only one valid birthday-component, otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthday("DEF66") # FALSE
#' inspect_birthday("GHI02") # TRUE
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