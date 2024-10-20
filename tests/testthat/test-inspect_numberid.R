# common cases
test_that("inspect_numericid detects if number has the expected length", {
  expect_equal(inspect_numericid(12345, 5), TRUE)
  expect_equal(inspect_numericid(123, 5), FALSE)
  expect_equal(inspect_numericid("AAA0101", 4), FALSE)
  expect_error(inspect_numericid(123.456))
})
