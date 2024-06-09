test_that("inspect_letters actually detects if a string contains the exact number of letters", {
  expect_equal(inspect_letters("12345", 3), FALSE)
  expect_equal(inspect_letters("ACAB5", 4), TRUE)
})
