#' recode a variabel in a tibble / dataframe
#'
#' @param data a tibble / dataframe
#' @param var the variable to be recoded
#' @param recode_map a names vecctor spedifying the recode map
#' @param new_var name of the new variable to be generated with the recoded values from 'recode_map' 
#'
#' @return a tibble  / dataframe with the new variable added
#' @export
#' @import dplyr
#'
#' @examples
#' # Example tibble
#' data <- tibble::tibble(
#'   id = 1:5,
#'   gender = c("Female", "Male", "Female", "Female", "Male"),
#'   status = c(1, 0, 2, 1, 0)
#' )
#'
#' # Recode maps
#' recode_map_gender <- c("Female" = "F", "Male" = "M", "Other" = "X")
#' 
#' # Applying the function
#' data <- recode_variable(data, gender, recode_map_gender, gender_recode)
#' 
#' print(data)
#' 
recode_in_df <- function(data, var, recode_map, new_var) {
  #is var in data?
  var <- enquo(var)
  if (!quo_name(var) %in% names(data)) {
    stop(paste("Variable", quo_name(var), "not found in the data"))
  }
  
  #apply recode function if map is not empty
  if (length(recode_map) == 0) {
    data <- data %>%
      mutate({{new_var}} := !!sym(quo_name(var)))
  } else {
    data <- data %>%
      mutate({{new_var}} := recode({{var}}, !!!recode_map))
  }
  
  return(data)
}
