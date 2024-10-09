#' recode a variable in a tibble / dataframe
#'
#' @param data a tibble / dataframe
#' @param var a variable to be recoded
#' @param recode_map a names vector specifying the recode map
#' @param new_var name of the new variable to be generated with the recoded values from 'recode_map' 
#'
#' @return a tibble  / dataframe with the new variable added
#' @export
#' @import dplyr 
#' @import tibble
#' @import rlang
#'
#' @examples
#' print(sailor_students)
#' recode_map_gender <- c("Female" = "F", "Male" = "M", "Other" = "X")
#' sailor_students_recoded <- 
#' recode_valinvec(sailor_students, gender, recode_map_gender, recode_gender)
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
