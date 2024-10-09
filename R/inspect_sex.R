#' Inspect if a value is in a specified recode map
#'
#' @param value A single value to inspect
#' @param recode_map A named vector where the names represent the keys to check against
#'
#' @return a logical value `TRUE` if the value is a key in the recode_map, otherwise `FALSE` 
#' @export
#'
#' @examples
#' recode_map <- c(male = "M", female = "F")
#' inspect_sex("male", recode_map) #TRUE
#' inspect_sex("other", recode_map) #FALSE
inspect_sex <- function(value, recode_map) {
  result <- value %in% names(recode_map)
  
  return(result)
}
