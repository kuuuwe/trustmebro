test_that("report invalid birthdaymonth actually extracts all SGICs with invalid birthdates", {
  # simulate testdata
  data <- tibble(
    code = c("ALE1606", "BFG0112", "DFG1045")
  )
  # apply function
  invalid_birthdaymonths <- report_invalid_birthdaymonth(data, "code", 4, 7)
  # test number of rows
  expect_equal(nrow(invalid_birthdaymonths), 1)
})
