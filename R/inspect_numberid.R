#' Inspect if a number has the expected length
#'
#' @description
#' Check whether a given numeric value has the expected number of digits.
#'
#' @param number A numeric value.
#' @param expected_length An integer specifying the expected number of digits.
#'
#' @return A logical value: `TRUE` if `number` has the expected length and consists only of digits, otherwise `FALSE`.
#' @export
#'
#' @examples
#' inspect_numericid(12345, 5)  # TRUE - 5 digits
#' inspect_numericid(1234, 5)    # FALSE - 4 digits
inspect_numericid <- function(number, expected_length) {
  #check if schoolnumber is numeric
  is_numeric <- grepl("^[0-9]+$", as.character(number))
  
  #check if length is as expected
  length_correct <- nchar(as.character(number)) == expected_length
  
  #return TRUE if both conditions are met, otherwise FALSE
  valid <- is_numeric & length_correct
  
  return(valid)
}
