#' clean a string
#'
#' @param string a string to be cleared
#'
#' @return a string without white space, non alpha-numeric characters are replaced by a hash tag
#' @export
#'
#' @examples
#' clean_string("  Giraffen_2b")
clean_string <- function(string) {
  trimws(string)
}
