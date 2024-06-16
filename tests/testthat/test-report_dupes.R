#common cases
test_that("inspect_dupes correctly identifies duplicates", {
  # data
  data <- tibble::tibble(
    id = 1:6,
    name = c("Alice", "Bob", "Alice", "David", "Alice", "Bob"),
    age = c(25, 30, 25, 40, 25, 30)
  )
  # expected result
  expected_result <- data %>%
    mutate(has_dupes = c(TRUE, TRUE, TRUE, FALSE, TRUE, TRUE))
  # call function
  result <- inspect_dupes(data, name, age)
  # test equal
  expect_equal(result, expected_result)
})

test_that("inspect_dupes handles no duplicates correctly", {
  # data
  data <- tibble::tibble(
    id = 1:4,
    name = c("Alice", "Bob", "Charlie", "David"),
    age = c(25, 30, 35, 40)
  )
  # expected restuls
  expected_result <- data %>%
    mutate(has_dupes = c(FALSE, FALSE, FALSE, FALSE))
  # call function
  result <- inspect_dupes(data, name, age)
  # test equal
  expect_equal(result, expected_result)
})

#edge cases
test_that("inspect_dupes handles empty data frame correctly", {
  # empty data
  data <- tibble::tibble(
    id = integer(0),
    name = character(0),
    age = integer(0)
  )
  # expected result
  expected_result <- data %>%
    mutate(has_dupes = logical(0))
  # call function
  result <- inspect_dupes(data, name, age)
  # test equal
  expect_equal(result, expected_result)
})
