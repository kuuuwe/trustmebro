#' inspect code structure
#'
#' @param code a string containing a SGIC
#' @param pattern an expected pattern / regex
#'
#' @return a logical value `TRUE` if the code matches the expected pattern, otherwise `FALSE`
#' @export
#'
#' @examples
#' inspect_codestructure("ABC1234", "^[A-Za-z]{3}[0-9]{4}$") #TRUE

inspect_codestructure <- function(code, pattern) {
  # is code a string
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # does code match pattern
  matches_pattern <- grepl(pattern, code)
  
  return(matches_pattern)
}