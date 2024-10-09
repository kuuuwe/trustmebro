#' report invalid values according to a recode map
#'
#' @param data a dataframe or tibble 
#' @param sex a value
#' @param recode_map expected length of the numeric value
#'
#' @return a tibble containing only values which are not a key in the recode_map,
#' @export
#' @import dplyr tibble
#' 
#' @examples
#' # Example data frame
#' data <- tibble::tibble(
#'   sex = c("male", "female", "other", "unknown", "FEMALE")
#' )
#'
#' # Example recode map
#' recode_map <- c(male = "M", female = "F")
#'
#' # Report invalid sex values
#' invalid_sex <- report_invalid_sex(data, "sex", recode_map)
#' print(invalid_sex)
#' 
report_invalid_sex <- function(data, sex, recode_map) {
  sex_valid <- NULL
  sex <- rlang::ensym(sex)
  # inspect schoolnumbers
  data <- data %>%
    mutate(sex_valid = inspect_sex(!!sex, recode_map))
  
  # extract invalid schoolnumbers
  invalid_sex <- data %>%
    filter(sex_valid == FALSE) %>%
    select(sex)
  
  return(invalid_sex)
}