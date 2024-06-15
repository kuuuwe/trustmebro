#' load and filter data from an rds-file
#'
#' @param filepath path to the rds-file
#' @param selection a list of variables to dplyr::select()
#' @param ... filter conditions to apply on the data
#'
#' @return a filtered tibble
#' @export
#' @import dplyr
#'
#' @examples
#' \dontrun{test <- load_keydata(filepath = "my/path/keydata.rds",
#' selection = c(year, GUID, schoolnumber, grade, class_designation, sex, my_code),
#' Quelle == 2324,
#' Klassenstufe == 5)}
#' 
load_keydata <- function(filepath, selection = NULL, ...) {
  #read RDS-file
  data <- readRDS(filepath)
  #check if tibble, convert otherwise
  if (!tibble::is_tibble(data)) {
    data <- as:tibble(data)
  }
  # select columns if provided
  if (!is.null(select)) {
    data <- data %>%
      select({{selection}})
  }
  #filter data if conditions are provided 
  data <- data %>%
    filter(...)
  
  return(data)
}
