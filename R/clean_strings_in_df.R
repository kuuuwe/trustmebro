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
#' print(sailor_students)
#'sailor_students_cleaned <- clean_strings_in_df(sailor_students)
#' print(sailor_students_cleaned)
clean_strings_in_df <- function(data) {
  data <- data %>%
    mutate(across(where(is.character), ~ {
      .x <- trimws(.x)  #trim whitespace
      .x[.x == ""] <- NA  #declare empty NA
      .x
    }))
  
  return(data)
}