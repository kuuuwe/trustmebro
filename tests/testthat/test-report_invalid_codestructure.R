test_that("report_invalid_codestructre actually reports invalid code structure", {
  # simulate testdata
  data <- tibble(
    code = c("AE16", "BFG01", "DFG10")
  )
  # apply function
  invalid_codestructures <- report_invalid_codestructure(data, "code", "^[A-Za-z]{3}[0-9]{2}$")
  # test number of rows
  expect_equal(nrow(invalid_codestructures), 1)
})
