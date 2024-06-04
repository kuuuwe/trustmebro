test_that("clean strings actually clenas a string", {
  expect_equal(" 2B_Giraffen", "2B#GIRAFFEN")
  expect_equal(" 1AFÜChse ", "1AFÜCHSE")
  expect_error(2345)
})
