test_that("report_invalid_birthmonth actually extracts all SGICs with invalid birthmonths", {
  # simulate testdata
  data <- tibble(
    code = c("ALE16", "BFG01", "DFG10")
  )
  # apply function
  invalid_birthmonths <- report_invalid_birthmonth(data, "code", 4, 5)
  # test number of rows
  expect_equal(nrow(invalid_birthmonths), 1)
})
