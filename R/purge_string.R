#' Replace non-alphanumeric characters and remove spaces and tabs in character columns of a tibble or data frame
#' 
#' @param data A dataframe or tibble containing columns to be processed
#' @param replacement The character or string to replace non-alphanumeric characters with. Default is "#"
#' @param ... variables to prepare for matching
#' @param keep characters that shall not be replaced
#'
#' @return A modified dataframe/ tibble with cleaned character columns
#' @export
#' @import dplyr
#' @import tibble
#'
#' @examples
#' print(sailor_students)
#' sailor_students_cleaned <- 
#' purge_string(sailor_students, sgic, school, class, gender, replacement = "#")
#' print(sailor_students_cleaned)
purge_string <- function(data, ..., replacement = "#", keep = "") {
  # Capture variables specified in ...
  vars <- enquos(...)
  
  # Create regex pattern for characters to keep (letters and numbers, plus any specified in 'keep')
  keep_pattern <- paste0("[^[:alnum:]", keep, "]")
  
  # If no variables are specified, use all character columns
  if (length(vars) == 0) {
    data <- data %>%
      mutate(across(where(is.character), ~ {
        .x <- ifelse(is.na(.x), replacement, .x)  # Replace NA with replacement
        .x <- trimws(.x)  # Remove whitespace from both ends
        .x <- gsub("[[:space:]]+", "", .x)  # Remove all whitespace (including spaces, tabs, newlines)
        .x <- gsub(keep_pattern, replacement, .x, perl = TRUE)  # Replace non-alphanumeric characters
        .x <- ifelse(.x == "", replacement, .x)  # Replace empty strings with replacement
        .x <- toupper(.x)  # Convert to uppercase
        .x
      }))
  } else {
    var_names <- sapply(vars, quo_name)  # Convert quosures to character names
    data <- data %>%
      mutate(across(all_of(var_names), ~ {
        .x <- ifelse(is.na(.x), replacement, .x)  # Replace NA with replacement
        .x <- trimws(.x)  # Remove whitespace from both ends
        .x <- gsub("[[:space:]]+", "", .x)  # Remove all whitespace (including spaces, tabs, newlines)
        .x <- gsub(keep_pattern, replacement, .x, perl = TRUE)  # Replace non-alphanumeric characters
        .x <- ifelse(.x == "", replacement, .x)  # Replace empty strings with replacement
        .x <- toupper(.x)  # Convert to uppercase
        .x
      }))
  }
  
  return(data)
}
