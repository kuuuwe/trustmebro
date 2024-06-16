#common cases
test_that("inspect_sex correctly identifies values in the recode map", {
  recode_map <- c(male = "M", female = "F")
  
  # "FEMALE" ist nicht in recode_map (case-sensitive)
  expect_false(inspect_sex("FEMALE", recode_map))
  
  # "male" ist in recode_map
  expect_true(inspect_sex("male", recode_map))
  
  # T"other" ist nicht in recode_map
  expect_false(inspect_sex("other", recode_map))
  
  # "female" ist in recode_map
  expect_true(inspect_sex("female", recode_map))
})

# edge cases
test_that("inspect_sex handles empty recode_map", {
  recode_map <- c()
  
  # empfy recode map should return FALSE
  expect_false(inspect_sex("male", recode_map))
  expect_false(inspect_sex("female", recode_map))
})

test_that("inspect_sex is case-sensitive", {
  recode_map <- c(MALE = "M", FEMALE = "F")
  
  # "male" und "female" sind nicht in recode_map (case-sensitive)
  expect_false(inspect_sex("male", recode_map))
  expect_false(inspect_sex("female", recode_map))
  
  # "MALE" und "FEMALE" sind in recode_map
  expect_true(inspect_sex("MALE", recode_map))
  expect_true(inspect_sex("FEMALE", recode_map))
})
