test_that("report_invalid_birthday actually extracts all SGICs with invalid birthdays", {
  # simulate testdata
  data <- tibble(
    code = c("ALE16", "BFG45", "DFG30")
  )
    # apply function
  invalid_birthdays <- report_invalid_birthday(data, "code", 4, 5)
    # test number of rows
  expect_equal(nrow(invalid_birthdays), 1)
})
