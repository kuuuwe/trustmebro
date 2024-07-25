#common cases
test_that("replace_nonalnum_in_df removes spaces and replaces non-alphanumeric characters", {
  # data
  df <- data.frame(
    name = c("Alice", "Bob", "Charlie"),
    description = c("Hello! This is a test string with numbers like 123 and special characters #$%.   Tabs:         ",
                    "This one has umlauts and spec!al char$cters...",
                    "Another sentence with @#$% special! characters and no numbers."),
    stringsAsFactors = FALSE
  )
  # expected result
  expected_df <- data.frame(
    name = c("Alice", "Bob", "Charlie"),
    description = c("Hello#Thisisateststringwithnumberslike123andspecialcharacters####Tabs#",
                    "Thisonehasumlautsandspec#alchar#cters###",
                    "Anothersentencewith####special#charactersandnonumbers#"),
    stringsAsFactors = FALSE
  )
  # call function
  df_modified <- replace_nonalnum_in_df(df, "#")
  # test equal
  expect_equal(df_modified, expected_df)
})

test_that("replace_nonalnum_in_df handles no character columns correctly", {
  # data
  df <- data.frame(
    age = c(25, 30, 35),
    height = c(170, 180, 175)
  )
  # expected result
  expected_df <- df
  # call function
  df_modified <- replace_nonalnum_in_df(df, "#")
  # test equal
  expect_equal(df_modified, expected_df)
})

test_that("replace_nonalnum_in_df allows custom replacement character", {
  # data
  df <- data.frame(
    name = c("Alice", "Bob", "Charlie"),
    description = c("Hello! This is a test string with numbers like 123 and special characters #$%.   Tabs:",
                    "This one has umlauts and spec!al char$cters...",
                    "Another sentence with @#$% special! characters and no numbers."),
    stringsAsFactors = FALSE
  )
  # expected result
  expected_df <- data.frame(
    name = c("Alice", "Bob", "Charlie"),
    description = c("Hello*Thisisateststringwithnumberslike123andspecialcharacters****Tabs*",
                    "Thisonehasumlautsandspec*alchar*cters***",
                    "Anothersentencewith****special*charactersandnonumbers*"),
    stringsAsFactors = FALSE
  )
  # call function
  df_modified <- replace_nonalnum_in_df(df, "*")
  # expect equal
  expect_equal(df_modified, expected_df)
})

test_that("replace_nonalnum_in_df handles no character columns with NAs correctly", {
  df <- data.frame(
    age = c(25, NA, 35),
    height = c(170, 180, 175)
  )
  # expected result
  expected_df <- data.frame(
    age = c("25", "#", "35"),
    height = c(170, 180, 175)
  )
  # call function
  df_modified <- replace_nonalnum_in_df(df, "#")
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
  df_modified <- replace_nonalnum_in_df(df, "#")
  # expect equal
  expect_equal(df_modified, expected_df)
})
