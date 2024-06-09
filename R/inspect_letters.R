#' inspect number of letters in a string
#'
#' @param code string containing a SGIC
#' @param expected_count expected number of letters
#'
#' @return a logical value `TRUE` if the string contains the expected number of letters, otherwise `FALSE`.
#' @export
#'
#' @examples
#' inspect_letters("DEF2802", 3) # TRUE
#' inspect_letters("GH6702", 3) # FALSE
inspect_letters <- function(code, expected_count) {
  #ist das ein string?
  if (!is.character(code)) {
    stop("invalid input: code must be a character vector")
  }
  
  # remove all non-letters
  cleaned_code <- gsub("[^A-Za-z]", "", code)
  
  # count letters
  letter_count <- nchar(cleaned_code)
  
  # compare acutal number of letters to expected number of letters
  if (letter_count == expected_count) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}