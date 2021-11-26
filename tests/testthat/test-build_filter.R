test_that("reducing transformation from list to value works", {
  filter <- tibble::tribble(
    ~column, ~operator, ~value, ~transformation,
    "event_url", "matches",
    list("^/someurl"), list("to_path")
  )

  filter <- build_filter(filter, "and")

  expect_equal(filter$conditions[[1]]$conditions[[1]]$transformation_id %>%
                 class(),
               "character")
})

test_that("reducing value from list to value works", {
  filter <- tibble::tribble(
    ~column, ~operator, ~value, ~transformation,
    "event_url", "matches",
    list("^/someurl"), "to_path"
  )

  filter <- build_filter(filter, "and")

  expect_equal(filter$conditions[[1]]$conditions[[1]]$condition$value %>%
                 class(),
               "character")
})
