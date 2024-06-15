inspect_sex <- function(data, var, recode_map) {
  var <- enquo(var)
  
  # Finden der nicht umcodierten Fälle
  not_in_map <- data %>%
    filter(!({{var}} %in% names(recode_map)))
  
  return(not_in_map)
}
