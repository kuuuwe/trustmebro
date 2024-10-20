# common cases
test_that("recode_valinvec works correctly", {
  test_data <- tibble(
    id = 1:5,
    sex = c("Female", "Male", "Other", NA, "Jace Beleren")
  )
  recode_map <- c("Female" = "F", "Male" = "M", "Other" = "X")
  data <- recode_valinvec(test_data, sex, recode_map, sex_new)
  expect_equal(data$sex_new, c("F", "M", "X", NA, "Jace Beleren"))
  expect_true("sex_new" %in% names(data))
  expect_equal(data$sex, test_data$sex)
  expect_error(recode_valinvec(test_data, invalid_var, recode_map, new_sex), 
               "Variable invalid_var not found in the data")
})

# edge cases
test_that("recode_valinvec handles edge cases", {
  empty_data <- tibble(id = integer(), sex = character())
  recode_map <- c("Female" = "F", "Male" = "M", "Other" = "X")
  data <- recode_valinvec(empty_data, sex, recode_map, sex_new)
  expect_equal(nrow(data), 0)
  expect_true("sex_new" %in% names(data))
  recode_map_empty <- c()
  test_data <- tibble(
    id = 1:5,
    sex = c("Female", "Male", "Other", NA, "Jace Beleren")
  )
  data <- recode_valinvec(test_data, sex, recode_map_empty, sex_new)
  expect_equal(data$sex_new, test_data$sex)
})
