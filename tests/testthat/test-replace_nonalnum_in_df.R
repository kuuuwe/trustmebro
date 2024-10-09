#common cases
test_that("replace_nonalnum_in_df removes spaces and replaces non-alphanumeric characters", {
  # data
  df <- sailor_students %>% select(sgic)
  # expected result
  expected_df <- tibble(
    
    sgic = c("MUC##0308", "H#T2701", "MUK3801", "SAM10", "T0601", 
             "UIT3006", "######", "#", "#", "MOA2210", 
             "MUK3801", "T0601"))
  # call function
  df_modified <- replace_nonalnum_in_df(df, sgic, replacement = "#")
  # test equal
  expect_equal(df_modified, expected_df)
})

test_that("replace_nonalnum_in_df handles no character columns correctly", {
  # data
  df <- sailor_students %>% select(testscore_langauge)
  # expected result
  expected_df <- tibble(
    
    testscore_langauge = c(425, 4596, 2456, 2345, 1234,
                           123, 56, 986, 284, 105,
                           9586, NA))
  # call function
  df_modified <- replace_nonalnum_in_df(df, replacement = "#")
  # test equal
  expect_equal(df_modified, expected_df)
})

test_that("replace_nonalnum_in_df allows custom replacement character", {
  # data
  df <- sailor_students %>% select(sgic)
  # expected result
  expected_df <- tibble(
    
    sgic = c("MUC$$0308", "H$T2701", "MUK3801", "SAM10", "T0601", 
             "UIT3006", "$$$$$$", "$", "$", "MOA2210", 
             "MUK3801", "T0601"))
  # call function
  df_modified <- replace_nonalnum_in_df(df, sgic, replacement = "$")
  # test equal
  expect_equal(df_modified, expected_df)
})

test_that("replace_nonalnum_in_df canbe used with pipe operator", {
  # data
  df <- sailor_students %>% select(sgic)
  # expected result
  expected_df <- tibble(
    
    sgic = c("MUC$$0308", "H$T2701", "MUK3801", "SAM10", "T0601", 
             "UIT3006", "$$$$$$", "$", "$", "MOA2210", 
             "MUK3801", "T0601"))
  # call function
  df_modified <- df %>% replace_nonalnum_in_df(sgic, replacement = "$")
  # test equal
  expect_equal(df_modified, expected_df)
})

test_that("replace_nonalnum_in_df can handle keep-parameters", {
  # data
  df <- sailor_students %>% select(sgic)
  # expected result
  expected_df <- tibble(
    
    sgic = c("MUC__0308", "HÄT2701", "MUK3801", "SAM10", "T0601", 
             "UIT3006", "@@@@@@", "$", "$", "MOA2210", 
             "MUK3801", "T0601"))
  # call function
  df_modified <- df %>% replace_nonalnum_in_df(sgic, replacement = "$", keep = "Ä_@")
  # test equal
  expect_equal(df_modified, expected_df)
})

#edge cases
test_that("replace_nonalnum_in_df handles empty data frame correctly", {
  # data empty
  df <- data.frame(
    name = character(0),
    description = character(0),
    stringsAsFactors = FALSE
  )
  # expected df
  expected_df <- df
  # call function
  df_modified <- replace_nonalnum_in_df(df, replacement = "#")
  # expect equal
  expect_equal(df_modified, expected_df)
})
