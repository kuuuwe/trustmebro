#' inspect birthday and -month component of a string
#'
#'@description
#'This function checks if a string contains only one number-component representing a valid combination of birthday followed by month
#'
#' @param code a string containing the SGIC
#'
#' @return a logical value `TRUE` if the string hat only one number-component representing a valid birthday and -month, otherwise `FALSE`. 
#' @export
#'
#' @examples
#' inspect_birthdaymonth("DEF2802") # TRUE
#' inspect_birthdaymonth("GHI3002") # FALSE
#' 
inspect_birthdaymonth <- function(code) {
  
  # check if input is a character
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # function for checking birthday and birthmonth
  check_string <- function(c) {
    # identify numbers
    match <- regmatches(c, gregexpr("\\d+", c))[[1]]
    
    # check for one block of numbers containing 4 digits
    if (length(match) != 1 || nchar(match) != 4) {
      return(FALSE)
    }
    
    # extract number component
    date_part <- match
    
    # extract day and month
    day <- as.numeric(substr(date_part, 1, 2))
    month <- as.numeric(substr(date_part, 3, 4))
    
    # check if month is valid
    if (is.na(month) || month < 1 || month > 12) {
      return(FALSE)
    }
    
    # number of days in month
    days_in_month <- c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
    
    # check if day is valid
    valid_day <- day >= 1 & day <= days_in_month[month]
    
    return(valid_day)
  }
  
  # check every element of vector
  result <- sapply(code, check_string, USE.NAMES = FALSE)
  
  return(result)
}