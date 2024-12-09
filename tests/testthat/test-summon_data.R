# common cases
test_that("summon_data correctly loads data and selects specific columns", {
  data("sailor_keys", package = "trustmebro")
  temp_filepath <- tempfile(fileext = ".rds")
  saveRDS(sailor_keys, temp_filepath)
  result <- summon_data(
    filepath = temp_filepath, 
    selection = c("schoolyear", "guid", "schoolnumber")
  )
  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 3)
  expect_named(result, c("schoolyear", "guid", "schoolnumber"))
  unlink(temp_filepath)
})

test_that("summon_data correctly filters data based on conditions", {
  data("sailor_keys", package = "trustmebro")
  temp_filepath <- tempfile(fileext = ".rds")
  saveRDS(sailor_keys, temp_filepath)
  result <- summon_data(
    filepath = temp_filepath,
    selection = c("schoolyear", "guid", "schoolnumber"),
    schoolyear == 2324
  )
  expect_s3_class(result, "tbl_df")
  expect_true(all(result$schoolyear == 2324))
  expect_equal(ncol(result), 3)
  expect_named(result, c("schoolyear", "guid", "schoolnumber"))
  unlink(temp_filepath)
})

test_that("summon_data returns the entire dataset when no selection is provided", {
  data("sailor_keys", package = "trustmebro")
  temp_filepath <- tempfile(fileext = ".rds")
  saveRDS(sailor_keys, temp_filepath)
  result <- summon_data(
    filepath = temp_filepath,
    selection = NULL  
  )
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), nrow(sailor_keys)) 
  expect_named(result, names(sailor_keys))  
  unlink(temp_filepath)
})

# edge cases
test_that("summon_data handles empty data frame correctly", {
  empty_df <- tibble::tibble()
  temp_filepath <- tempfile(fileext = ".rds")
  saveRDS(empty_df, temp_filepath)
  result <- summon_data(
    filepath = temp_filepath
  )
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 0)
  unlink(temp_filepath)
})
