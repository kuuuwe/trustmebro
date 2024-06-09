test_that("report invalid birthday actually extracts all SGICs with incalid birthdays", {
  # simulate testdata
  data <- tibble(
    code = c("ALE16", "BFG45", "DFG30")
  )
    # apply function
  invalid_birthdays <- report_invalid_birthday(data, "code", 4, 5)
    # Teste die Anzahl der Zeilen in invalid_birthdays
  expect_equal(nrow(invalid_birthdays), 1)
})
