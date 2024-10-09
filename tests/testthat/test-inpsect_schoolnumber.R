test_that("inspect_schoolnumber detects if schoolnumber has the expected length", {
  expect_equal(inspect_schoolnumber(12345, 5), TRUE)
  expect_equal(inspect_schoolnumber(123, 5), FALSE)
  expect_equal(inspect_schoolnumber("AAA0101", 4), FALSE)
})
