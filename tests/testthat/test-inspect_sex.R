test_that("inspect_sex works correctly", {
  #generate data
  test_data <- tibble(
    id = 1:5,
    sex = c("M", "F", "M", "X", "F")
  )
  #recode map
  recode_map <- c("M" = "Male", "F" = "Female")
  
  # Test: Einige Werte sind nicht in der Recodierungsmap
  not_in_map <- inspect_sex(test_data, sex, recode_map)
  expect_equal(nrow(not_in_map), 1)
  expect_equal(not_in_map$sex, "X")
  
  # Test: Alle Werte sind in der Recodierungsmap
  recode_map_full <- c("M" = "Male", "F" = "Female", "X" = "Unknown")
  not_in_map_full <- inspect_sex(test_data, sex, recode_map_full)
  expect_equal(nrow(not_in_map_full), 0)
  
  # Test: Keine Werte sind in der Recodierungsmap
  recode_map_empty <- c()
  not_in_map_empty <- inspect_sex(test_data, sex, recode_map_empty)
  expect_equal(nrow(not_in_map_empty), 5)
  expect_equal(not_in_map_empty$sex, test_data$sex)
  
  # Test: Leere Daten
  empty_data <- tibble(id = integer(), sex = character())
  not_in_map_empty_data <- inspect_sex(empty_data, sex, recode_map)
  expect_equal(nrow(not_in_map_empty_data), 0)
})
