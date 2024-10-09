#common cases
test_that("inspect_valinvec correctly identifies values in the recode map", {
  recode_map <- c(male = "M", female = "F")
  
  # "FEMALE" ist nicht in recode_map (case-sensitive)
  expect_false(inspect_valinvec("FEMALE", recode_map))
  
  # "male" ist in recode_map
  expect_true(inspect_valinvec("male", recode_map))
  
  # T"other" ist nicht in recode_map
  expect_false(inspect_valinvec("other", recode_map))
  
  # "female" ist in recode_map
  expect_true(inspect_valinvec("female", recode_map))
})

# edge cases
test_that("inspect_valinvec handles empty recode_map", {
  recode_map <- c()
  
  # empfy recode map should return FALSE
  expect_false(inspect_valinvec("male", recode_map))
  expect_false(inspect_valinvec("female", recode_map))
})

test_that("inspect_valinvec is case-sensitive", {
  recode_map <- c(MALE = "M", FEMALE = "F")
  
  # "male" und "female" sind nicht in recode_map (case-sensitive)
  expect_false(inspect_valinvec("male", recode_map))
  expect_false(inspect_valinvec("female", recode_map))
  
  # "MALE" und "FEMALE" sind in recode_map
  expect_true(inspect_valinvec("MALE", recode_map))
  expect_true(inspect_valinvec("FEMALE", recode_map))
})
