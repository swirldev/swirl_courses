test_func1 <- function() {
  try({
    func <- get('boring_function', globalenv())
    t1 <- identical(func(9), 9)
    t2 <- identical(func(4), 4)
    t3 <- identical(func(0), 0)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}
