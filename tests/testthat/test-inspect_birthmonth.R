test_that("inspect_birthmonth detects if birthmonth is correctly provided", {
  expect_equal(inspect_birthmonth("KNE1612", 6, 7), TRUE)
  expect_equal(inspect_birthmonth("ALS3133", 6, 7), FALSE)
  expect_error(inspect_birthmonth("AAA0101", 7, 2))
  expect_error(inspect_birthmonth(345, 6, 7))
})
