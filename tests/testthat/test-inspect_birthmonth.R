# common cases
test_that("inspect_birthmonth detects if birthmonth is correctly provided", {
  expect_equal(inspect_birthmonth("KNE12"), TRUE)
  expect_equal(inspect_birthmonth("ALS33"), FALSE)
  expect_equal(inspect_birthmonth("08DGT"), TRUE)
  expect_error(inspect_birthmonth(345))
})
