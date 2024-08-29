#' Replace non-alphanumeric characters and remove spaces and tabs in character columns of a tibble or data frame, umlauts and eszett remain unchanged, empty strings get replaced
#'
#' @param data A dataframe or tibble containing columns to be processed
#' @param replacement The character or string to replace non-alphanumeric characters with. Default is "#"
#' @param ... variables to prepare for matching
#'
#' @return A modified dataframe/ tibble with cleaned character columns
#' @export
#' @import dplyr
#' @import tibble
#'
#' @examples
#' sailor_students_cleaned <- replace_nonalnum_in_df(sailor_students, sgic, replacement = "#")
replace_nonalnum_in_df <- function(data, ..., replacement = "#") {
  # Capture variables specified in ...
  vars <- enquos(...)
  
  # If no variables are specified, use all character columns
  if (length(vars) == 0) {
    data <- data %>%
      mutate(across(where(is.character), ~ {
        .x <- ifelse(trimws(.x) == "", replacement, .x)  # Replace only-whitespace strings with replacement
        .x <- ifelse(is.na(.x), replacement, .x)  # Replace NA with replacement
        .x <- gsub("[[:space:]]+", "", .x)  # Remove all whitespace (including tabs, newlines)
        .x <- gsub("[^[:alnum:]\u00e4\u00f6\u00fc\u00c4\u00d6\u00dc\u00df\u1e9e]", replacement, .x)  # Replace non-alphanumeric characters
        .x <- toupper(.x)  # Convert to uppercase
        .x
      }))
  } else {
    var_names <- sapply(vars, quo_name)  # Convert quosures to character names
    data <- data %>%
      mutate(across(all_of(var_names), ~ {
        .x <- ifelse(trimws(.x) == "", replacement, .x)  # Replace only-whitespace strings with replacement
        .x <- as.character(.x)  # Convert to character
        .x <- ifelse(is.na(.x), replacement, .x)  # Replace NA with replacement
        .x <- gsub("[[:space:]]+", "", .x)  # Remove all whitespace (including tabs, newlines)
        .x <- gsub("[^[:alnum:]\u00e4\u00f6\u00fc\u00c4\u00d6\u00dc\u00df\u1e9e]", replacement, .x)  # Replace non-alphanumeric characters
        .x <- toupper(.x)  # Convert to uppercase
        .x
      }))
  }
  
  return(data)
}