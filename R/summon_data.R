#' Load an RDS-file and select/filter Variables
#'
#' @description
#' Read data from a RDS-file, filter the resulting tibble based on the provided 
#' filter conditions and optionally specify a list of variables to select from the data. 
#' If the data is not already a tibble, it will be converted before any operations are performed.
#'
#' @param filepath path to the rds-file to be loaded.
#' @param selection An optional character vector of variable names to be selected from the data using `dplyr::select()`. 
#' If not provided, all columns from the data will be retained.
#' @param ... Additional filtering conditions that will be applied to the data using `dplyr::filter()`. 
#'
#' @return A filtered tibble containing the selected variables and rows that meet the specified filter conditions.
#' @export
#' @import dplyr
#' @import tibble
#'
#' @examples
#' 
#' \dontrun{
#' test <- summon_data(filepath = "my/path/keydata.rds",
#' selection = c(year, GUID, schoolnumber, grade, class_designation, sex, sgic),
#' year == 2324,
#' class_designation == 5
#' )}
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
