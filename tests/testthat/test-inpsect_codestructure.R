test_that("inspect_codestructure actually identifies expected pattern", {
  expect_equal(inspect_invalid_codestructure("ABC1234", "^[A-Za-z]{3}[0-9]{4}$"), TRUE)
})
