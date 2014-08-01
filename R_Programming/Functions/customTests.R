#' TODO:
#' - Use testthat for more robust unit testing of functions?
#' - Test that functions error appropriately
#' - Create our own little wrapper around testthat or other DSL that
#'    simplifies unit testing functions for course authors?

test_func1 <- function() {
  try({
    func <- get('f', globalenv())
    t1 <- identical(func(3), 9)
    t2 <- identical(func(-2), 4)
    t3 <- identical(func(0), 0)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_func2 <- function() {
  try({
    func <- get('f', globalenv())
    t1 <- identical(func(3, 3), 27)
    t2 <- identical(func(-2, 4), 16)
    t3 <- identical(func(0, 3), 0)
    t4 <- identical(func(-3, 0), 1)
    ok <- all(t1, t2, t3, t4)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_func3 <- function() {
  try({
    func <- get('min_positive', globalenv())
    t1 <- identical(func(c(-4, 4, 2, 10)), 2)
    t2 <- identical(func(c(0, 9)), 0)
    t3 <- identical(func(c(-11, 0, 39)), 0)
    t4 <- identical(func(c(5, 6, 7, 7)), 5)
    ok <- all(t1, t2, t3, t4)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}
