# common cases
test_that("inspect_birthday detects if birthday is correctly provided", {
  expect_equal(inspect_birthday("KNE12"), TRUE)
  expect_equal(inspect_birthday("ALS67"), FALSE)
  expect_equal(inspect_birthday("02DFGTR"), TRUE)
  expect_equal(inspect_birthday("356AA0101"), FALSE)
  expect_error(inspect_birthday(345))
})
