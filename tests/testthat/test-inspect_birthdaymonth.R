# common cases
test_that("inspect_birthdaymonth detects if birthday and birthmonth are correctly provided", {
  expect_equal(inspect_birthdaymonth("KNE1612"), TRUE)
  expect_equal(inspect_birthdaymonth("ALS3102"), FALSE)
  expect_equal(inspect_birthdaymonth("5AAA0101"), FALSE)
  expect_equal(inspect_birthdaymonth("3103AAA"), TRUE)
  expect_equal(inspect_birthdaymonth("ADF3103", format = "DDMM"), TRUE)
  expect_equal(inspect_birthdaymonth("31ADF03", format = "DDMM"), FALSE)
  expect_error(inspect_birthdaymonth("2108", format = "yyddmm"))
  expect_error(inspect_birthdaymonth(345))
})