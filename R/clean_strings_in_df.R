#' clean all characters in a tibble/ data frame
#'
#' @param data a tibble/ dataframe
#'
#' @return a tibble / dataframe where whitespace is removed and empty characters are NAs
#' @export
#' @import dplyr
#' @import tibble
#'
#' @examples
#' 
#' 
#' data <- tibble::tibble(
#' name = c(" Oli Bock", "Oli Gorth   ", "  Oli Hackbarth "),
#' testscore = c(125, 195, 345),
#' sgic = c("OEB_1345", "LKR 29 854", " R T SSS 1356"))
#' 
#' 
#' clean_strings_in_df(data)
#' 
#' 
#' print(data)
#' 
clean_strings_in_df <- function(data) {
  data <- data %>%
    mutate(across(where(is.character), ~ {
      .x <- trimws(.x)  #trim whitespace
      .x[.x == ""] <- NA  #declare empty NA
      .x
    }))
  
  return(data)
}