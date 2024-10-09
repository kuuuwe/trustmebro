#common cases
test_that("find_dupes correctly identifies duplicate cases", {
  # data
  data <- tibble::tibble(
    id = 1:5,
    name = c("Alice", "Bob", "Alice", "David", "Alice"),
    age = c(25, 30, 25, 40, 25)
  )
  # expected result
  expected_result <- data %>%
    mutate(has_dupes = c(TRUE, FALSE, TRUE, FALSE, TRUE))
  # call function
  result <- find_dupes(data, name, age)
  # test equal
  expect_equal(result, expected_result)
})

test_that("find_dupes handles no duplicates correctly", {
  # data
  data <- tibble::tibble(
    id = 1:4,
    name = c("Alice", "Bob", "Charlie", "David"),
    age = c(25, 30, 35, 40)
  )
  # expected result
  expected_result <- data %>%
    mutate(has_dupes = FALSE)
  # call function
  result <- find_dupes(data, name, age)
  # test equal
  expect_equal(result, expected_result)
})

#edge caees
test_that("find_dupes handles empty data frame", {
  # data empty
  data <- tibble::tibble(
    id = integer(0),
    name = character(0),
    age = integer(0)
  )
  # expected result
  expected_result <- data %>%
    mutate(has_dupes = logical(0))
  # call function
  result <- find_dupes(data, name, age)
  # test equal
  expect_equal(result, expected_result)
})
