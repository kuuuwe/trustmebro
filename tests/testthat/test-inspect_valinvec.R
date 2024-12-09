# common cases
test_that("inspect_valinvec correctly identifies values in the recode map", {
  recode_map <- c(male = "M", female = "F")
  expect_false(inspect_valinvec("FEMALE", recode_map))
  expect_true(inspect_valinvec("male", recode_map))
  expect_false(inspect_valinvec("other", recode_map))
  expect_true(inspect_valinvec("female", recode_map))
})

# edge cases
test_that("inspect_valinvec handles empty recode_map", {
  recode_map <- c()
  expect_false(inspect_valinvec("male", recode_map))
  expect_false(inspect_valinvec("female", recode_map))
})

test_that("inspect_valinvec is case-sensitive", {
  recode_map <- c(MALE = "M", FEMALE = "F")
  expect_false(inspect_valinvec("male", recode_map))
  expect_false(inspect_valinvec("female", recode_map))
  expect_true(inspect_valinvec("MALE", recode_map))
  expect_true(inspect_valinvec("FEMALE", recode_map))
})
