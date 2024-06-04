test_that("inspect_birthday detects if birthday is correctly provided", {
  expect_equal(inspect_birthday("KNE1612", 4, 5), TRUE)
  expect_equal(inspect_birthday("ALS3102", 4, 5), TRUE)
  expect_error(inspect_birthday("AAA0101", 7, 2))
  expect_error(inspect_birthday(345, 6, 7))
})
