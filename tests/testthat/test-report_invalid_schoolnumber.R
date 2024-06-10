test_that("report_invalid_schoolnumber actually extracts all invalid schoolnumbers", {
  # simulate testdata
  data <- tibble(
    schoolnumber = c(12345, 54321, 123)
  )
  # apply function
  invalid_schoolnumbers <- report_invalid_schoolnumber(data, "schoolnumber", 5)
  # test number of rows
  expect_equal(nrow(invalid_schoolnumbers), 1)
})
