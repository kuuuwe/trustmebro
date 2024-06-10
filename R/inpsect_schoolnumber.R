#' inspect if a schoolnumber has the expected length
#'
#' @param schoolnumber a numeric value
#' @param expected_length expected digits of schoolnumber
#'
#' @return a logical value `TRUE` if the substring represents a valid birthmonth, otherwise `FALSE`
#' @export
#'
#' @examples
#' inspect_schoolnumber(12345, 5)  # TRUE
#' inspect_schoolnumber(123456, 5)  # FALSE
inspect_schoolnumber <- function(schoolnumber, expected_length) {
  # is schoolnumber a number?
  if (!is.numeric(schoolnumber)) {
    stop("invalid input: schoolnumber must be a numeric vector")
  }
    # check if length is as expected
  length_correct <- nchar(as.character(schoolnumber)) == expected_length
  
  return(length_correct)
}