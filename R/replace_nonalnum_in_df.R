#' Replace non-alphanumeric characters and remove spaces and tabs in character columns of a tibble or data frame, umlauts and eszett remain unchanged
#'
#' @param data A dataframe or tibble containing columns to be processed
#' @param replacement The character or string to replace non-alphanumeric characters with. Default is "#"
#'
#' @return A modified dataframe/ tibble with cleaned character columns
#' @export
#' @import dplyr
#' @import tibble
#'
#' @examples
#' data <- tibble::tibble(
#'   name = c("Alice", "Bob", "Charlie"),
#'   description = c("Hello! 123 and special characters #$%.   Tabs:     ",
#'                   "This one has umlauts and spec!al char$cters...",
#'                   "Another sentence with @#$% special! characters and no numbers.")
#' )
#' data_modified <- replace_nonalnum_in_df(data, "#")
replace_nonalnum_in_df <- function(data, ..., replacement = "#") {
  # Capture variables specified in ...
  vars <- enquos(...)
  
  # If no variables are specified, use all character columns
  if (length(vars) == 0) {
    data <- data %>%
      mutate(across(where(is.character), ~ {
        .x <- ifelse(is.na(.x), replacement, .x)  # Replace NA with replacement
        .x <- gsub("[[:space:]]+", "", .x)  # Remove all whitespace (including tabs, newlines)
        .x <- gsub("[^[:alnum:]\u00e4\u00f6\u00fc\u00c4\u00d6\u00dc\u00df\u1e9e]", replacement, .x)  # Replace non-alphanumeric characters
        .x
      }))
  } else {
    data <- data %>%
      mutate(across(all_of(vars), as.character)) %>%  # Convert specified columns to character
      mutate(across(all_of(vars), ~ {
        .x <- ifelse(is.na(.x), replacement, .x)  # Replace NA with replacement
        .x <- gsub("[[:space:]]+", "", .x)  # Remove all whitespace (including tabs, newlines)
        .x <- gsub("[^[:alnum:]\u00e4\u00f6\u00fc\u00c4\u00d6\u00dc\u00df\u1e9e]", replacement, .x)  # Replace non-alphanumeric characters
        .x
      }))
  }
  
  return(data)
}