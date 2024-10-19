#' Inspect birthday- and birthmonth-component of a string
#'
#'@description
#' Checks whether a given string contains exactly one four-digit number representing a valid combination of a day (birthday) and a month (birthmonth).
#' Numeric components can be interpreted in either "DDMM" (day-month) or "MMDD" (month-day) format, depending on the specified format.
#' The string is assumed to be a code (e.g., a SGIC), which may include letters and digits.
#' 
#' @param code A character string containing a SGIC or similar code that may include a numeric component representing a birthday and birthmonth.
#' @param format A string specifying the format of the birthdate-components in code. 
#'        Use "DDMM" for day-month format and "MMDD" for month-day format. 
#'        Default is "DDMM".
#' @return A logical value: `TRUE` if the string contains exactly one valid numeric component that forms a valid birthday (day and month), otherwise `FALSE`.
#' @export
#'
#' @examples
#' inspect_birthdaymonth("DEF2802") # TRUE - 28th of February is a valid date
#' inspect_birthdaymonth("GHI3002") # FALSE - 30th of February is invalid
#' inspect_birthdaymonth("XYZ3112") # TRUE - 31st of December is valid
#' inspect_birthdaymonth("18DEF02") # FALSE - Multiple numeric components
#' inspect_birthdaymonth("XYZ") # FALSE - No numeric components
#' inspect_birthdaymonth("ABC1231", format = "MMDD") # TRUE - December 31st is valid
inspect_birthdaymonth <- function(code, format = "DDMM") {
  
  # check if input is a character
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # check if format is valid
  if (!format %in% c("DDMM", "MMDD")) {
    stop("invalid format: format must be 'DDMM' or 'MMDD'")
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
    
    if (format == "DDMM") {
      # DDMM: first 2 digits = day, last 2 digits = month
      day <- as.numeric(substr(date_part, 1, 2))
      month <- as.numeric(substr(date_part, 3, 4))
    } else if (format == "MMDD") {
      # MMDD: first 2 digits = month, last 2 digits = day
      month <- as.numeric(substr(date_part, 1, 2))
      day <- as.numeric(substr(date_part, 3, 4))
    }
    
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