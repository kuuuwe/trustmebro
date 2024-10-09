#' inspect if a number has the expected length
#'
#' @param number a numeric value
#' @param expected_length expected digits of schoolnumber
#'
#' @return a logical value `TRUE` if the substring represents a valid schoolnumber, otherwise `FALSE`
#' @export
#'
#' @examples
#' inspect_numericid(12345, 5)  # TRUE
#' inspect_numericid(123456, 5)  # FALSE
inspect_numericid <- function(number, expected_length) {
  #check if schoolnumber is numeric
  is_numeric <- grepl("^[0-9]+$", as.character(number))
  
  #check if length is as expected
  length_correct <- nchar(as.character(number)) == expected_length
  
  #return TRUE if both conditions are met, otherwise FALSE
  valid <- is_numeric & length_correct
  
  return(valid)
}
