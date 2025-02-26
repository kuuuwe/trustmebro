# common cases
test_that("inspect_numberid detects if number has the expected length", {
  expect_equal(inspect_numberid(12345, 5), TRUE)
  expect_equal(inspect_numberid(123, 5), FALSE)
  expect_equal(inspect_numberid("AAA0101", 4), FALSE)
  expect_error(inspect_numberid(123.456))
})
