# common cases
test_that("purge_string removes spaces and replaces non-alphanumeric characters", {
  df <- sailor_students %>% select(sgic)
  expected_df <- tibble(
    sgic = c("MUC##0308", "H#T2701", "MUK3801", "SAM10", "T0601", 
             "UIT3006", "######", "#", "#", "MOA2210", 
             "MUK3801", "T0601"))
  df_modified <- purge_string(df, sgic, replacement = "#")
  expect_equal(df_modified, expected_df)
})

test_that("purge_string handles no character columns correctly", {
  df <- sailor_students %>% select(testscore_langauge)
  expected_df <- tibble(
    
    testscore_langauge = c(425, 4596, 2456, 2345, 1234,
                           123, 56, 986, 284, 105,
                           9586, NA))
  df_modified <- purge_string(df, replacement = "#")
  expect_equal(df_modified, expected_df)
})

test_that("purge_string allows custom replacement character", {
  df <- sailor_students %>% select(sgic)
  expected_df <- tibble(
    sgic = c("MUC$$0308", "H$T2701", "MUK3801", "SAM10", "T0601", 
             "UIT3006", "$$$$$$", "$", "$", "MOA2210", 
             "MUK3801", "T0601"))
  df_modified <- purge_string(df, sgic, replacement = "$")
  expect_equal(df_modified, expected_df)
})

test_that("purge_string canbe used with pipe operator", {
  df <- sailor_students %>% select(sgic)
  expected_df <- tibble(
    sgic = c("MUC$$0308", "H$T2701", "MUK3801", "SAM10", "T0601", 
             "UIT3006", "$$$$$$", "$", "$", "MOA2210", 
             "MUK3801", "T0601"))
  df_modified <- df %>% purge_string(sgic, replacement = "$")
  expect_equal(df_modified, expected_df)
})

test_that("purge_string can handle keep-parameters", {
  df <- sailor_students %>% select(sgic)
  expected_df <- tibble(
    sgic = c("MUC__0308", "HÄT2701", "MUK3801", "SAM10", "T0601", 
             "UIT3006", "@@@@@@", "$", "$", "MOA2210", 
             "MUK3801", "T0601"))
  df_modified <- df %>% purge_string(sgic, replacement = "$", keep = "Ä_@")
  expect_equal(df_modified, expected_df)
})

# edge cases
test_that("purge_string handles empty data frame correctly", {
  df <- data.frame(
    name = character(0),
    description = character(0),
    stringsAsFactors = FALSE
  )
  expected_df <- df
  df_modified <- purge_string(df, replacement = "#")
  expect_equal(df_modified, expected_df)
})
