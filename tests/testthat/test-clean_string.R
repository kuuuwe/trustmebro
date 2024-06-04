test_that("clean strings actually clenas a string", {
  expect_equal(clean_string(" 2B_Giraffen"), "2B#GIRAFFEN")
  expect_equal(clean_string(" 1AFuChse "), "1AFUCHSE")
  expect_error(2345)
})
