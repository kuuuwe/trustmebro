#' Purge strings in a data frame
#' 
#' @description
#' Clean specified character columns in a data frame or tibble by removing non-alphanumeric characters, 
#' replacing them with a specified character (default is "#"). Also replaces NA values and allows for 
#' additional characters to keep in the cleaned strings. The resulting strings are converted to uppercase.
#'
#' @param data A data frame or tibble containing columns to be cleaned.
#' @param replacement A character string used to replace unwanted characters and empty strings. Default is "#".
#' @param ... Variables to clean. If none are provided, all character columns will be processed.
#' @param keep A character string containing any additional characters that should be retained in the cleaned strings.
#'
#' @return A data frame or tibble with the specified character columns cleaned and modified as per the given parameters.
#' @export
#' @import dplyr
#' @import tibble
#'
#' @examples
#' # Example data
#' print(sailor_students)
#' 
#' # Clean all character columns, replacing unwanted characters with "#", retaining "-" 
#' sailor_students_cleaned <- 
#' purge_string(sailor_students, sgic, school, class, gender, keep = "-")
#' 
#' # Tibble with cleaned 'sgic', 'school', 'class' and 'gender' columns
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
