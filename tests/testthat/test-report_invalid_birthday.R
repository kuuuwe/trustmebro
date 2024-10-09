test_that("report_invalid_birthday actually extracts all SGICs with invalid birthdays", {
  # simulate testdata
  data <- tibble(
    code = c("ALE16", "BFG45", "DFG30", "03FLG02")
  )
    # apply function
  invalid_birthdays <- report_invalid_birthday(data, "code")
    # test number of rows
  expect_equal(nrow(invalid_birthdays), 2)
})
