#' Recode a variable
#'
#' @description
#' Recode a specified variable in a data frame or tibble based on a provided recode map. 
#' If the recode map is empty, the original variable is retained under a new name.
#'
#' @param data A data frame or tibble.
#' @param var A variable to be recoded.
#' @param recode_map A named vector specifying the recode map.
#' @param new_var Name of the new variable holding the recoded values.
#'
#' @return A data frame or tibble with the new variable added.
#' @export
#' @import dplyr 
#' @import tibble
#' @import rlang
#'
#' @examples
#' # Example data
#' print(sailor_students)
#' 
#' # Define a recode map for gender
#' recode_map_gender <- c("Female" = "F", "Male" = "M", "Other" = "X")
#' 
#' # Recode gender
#' sailor_students_recoded <- 
#' recode_valinvec(sailor_students, gender, recode_map_gender, recode_gender)
#' 
#' # A tibble with a recoded gender variable
#' print(sailor_students_recoded)
recode_valinvec <- function(data, var, recode_map, new_var) {
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
