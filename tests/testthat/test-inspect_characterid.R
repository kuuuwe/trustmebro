# common cases
test_that("inspect_characterid actually identifies expected pattern", {
  expect_equal(inspect_characterid("ABC1234", "^[A-Za-z]{3}[0-9]{4}$"), TRUE)
  expect_equal(inspect_characterid("1234ABC", "^[A-Za-z]{3}[0-9]{4}$"), FALSE)
  expect_error(inspect_characterid(12345, "^[A-Za-z]{3}[0-9]{4}$"))
})
