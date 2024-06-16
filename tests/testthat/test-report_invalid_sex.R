#common case
test_that("report_invalid_sex identifies invalid sex values correctly", {
  # data
  data <- tibble::tibble(
    sex = c("male", "female", "other", "unknown", "FEMALE")
  )
  # recode map
  recode_map <- c(male = "M", female = "F")
  # testergebnis
  expected_invalid <- tibble::tibble(
    sex = c("other", "unknown", "FEMALE")
  )
  #call function to test
  invalid_sex <- report_invalid_sex(data, "sex", recode_map)
  # test equal
  expect_equal(invalid_sex, expected_invalid)
})

#edge cases
test_that("report_invalid_sex handles an empty data frame", {
  # data
  data <- tibble::tibble(
    sex = character(0)
  )
  # recode map
  recode_map <- c(male = "M", female = "F")
    # testergebnis
  expected_invalid <- tibble::tibble(
    sex = character(0)
  )
  # call function to test
  invalid_sex <- report_invalid_sex(data, "sex", recode_map)
  # test equal
  expect_equal(invalid_sex, expected_invalid)
})

test_that("report_invalid_sex handles an empty recode map", {
  # data
  data <- tibble::tibble(
    sex = c("male", "female", "other", "unknown", "FEMALE")
  )
  # recode map
  recode_map <- c()
  # testergebnis
  expected_invalid <- tibble::tibble(
    sex = c("male", "female", "other", "unknown", "FEMALE")
  )
  # call fucntion
  invalid_sex <- report_invalid_sex(data, "sex", recode_map)
  # test equal
  expect_equal(invalid_sex, expected_invalid)
})
