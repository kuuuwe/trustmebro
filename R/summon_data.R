#' load and filter data from an rds-file
#'
#' @param filepath path to the rds-file
#' @param selection a list of variables to dplyr::select()
#' @param ... filter conditions to apply on the data
#'
#' @return a filtered tibble
#' @export
#' @import dplyr
#' @import tibble
#'
#' @examples
#' 
#' \dontrun{test <- summon_data(filepath = "my/path/keydata.rds",
#' selection = c(year, GUID, schoolnumber, grade, class_designation, sex, sgic),
#' year == 2324,
#' class_designation == 5)}
#' 
summon_data <- function(filepath, selection = NULL, ...) {
  #read RDS-file
  data <- readRDS(filepath)
  #check if tibble, convert otherwise
  if (!tibble::is_tibble(data)) {
    data <- as_tibble(data)
  }
  # select columns if provided
  if (!is.null(selection)) {
    data <- data %>%
      select({{selection}})
  }
  #filter data if conditions are provided 
  data <- data %>%
    filter(...)
  
  return(data)
}
