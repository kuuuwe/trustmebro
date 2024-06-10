test_that("report_invalid_letters actually extracts all SGICs with invalid number of letters", {
  # simulate testdata
  data <- tibble(
    code = c("ALE16", "BFGX1", "FG10")
  )
  # apply function
  invalid_letters <- report_invalid_letters(data, "code", 3)
  # test number of rows
  expect_equal(nrow(invalid_letters), 2)
})
