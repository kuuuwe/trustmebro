test_that("inspect_birthdaymonth detects if birthday and birthmonth are correctly provided", {
  expect_equal(inspect_birthdaymonth("KNE1612", 4, 7), TRUE)
  expect_equal(inspect_birthdaymonth("ALS3102", 4, 7), FALSE)
  expect_error(inspect_birthdaymonth("AAA0101", 7, 2))
  expect_error(inspect_birthdaymonth(345, 1, 7))
})
