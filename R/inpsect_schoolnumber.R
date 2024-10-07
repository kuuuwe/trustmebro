#' inspect if a schoolnumber has the expected length
#'
#' @param schoolnumber a numeric value
#' @param expected_length expected digits of schoolnumber
#'
#' @return a logical value `TRUE` if the substring represents a valid schoolnumber, otherwise `FALSE`
#' @export
#'
#' @examples
#' inspect_schoolnumber(12345, 5)  # TRUE
#' inspect_schoolnumber(123456, 5)  # FALSE
inspect_schoolnumber <- function(schoolnumber, expected_length) {
  #check if schoolnumber is numeric
  is_numeric <- grepl("^[0-9]+$", as.character(schoolnumber))
  
  #check if length is as expected
  length_correct <- nchar(as.character(schoolnumber)) == expected_length
  
  #return TRUE if both conditions are met, otherwise FALSE
  valid <- is_numeric & length_correct
  
  return(valid)
}
