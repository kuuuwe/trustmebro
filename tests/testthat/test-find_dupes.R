# common cases
test_that("find_dupes correctly identifies duplicate cases", {
  data <- tibble::tibble(
    id = 1:5,
    name = c("Alice", "Bob", "Alice", "David", "Alice"),
    age = c(25, 30, 25, 40, 25)
  )
  expected_result <- data %>%
    mutate(has_dupes = c(TRUE, FALSE, TRUE, FALSE, TRUE))
  result <- find_dupes(data, name, age)
  expect_equal(result, expected_result)
})

test_that("find_dupes handles no duplicates correctly", {
  data <- tibble::tibble(
    id = 1:4,
    name = c("Alice", "Bob", "Charlie", "David"),
    age = c(25, 30, 35, 40)
  )
  expected_result <- data %>%
    mutate(has_dupes = FALSE)
  result <- find_dupes(data, name, age)
  expect_equal(result, expected_result)
})

# edge caees
test_that("find_dupes handles empty data", {
  data <- tibble::tibble(
    id = integer(0),
    name = character(0),
    age = integer(0)
  )
  expected_result <- data %>%
    mutate(has_dupes = logical(0))
  result <- find_dupes(data, name, age)
  expect_equal(result, expected_result)
})
