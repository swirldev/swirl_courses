check_even <- function() {
  # Get environment e, which contains information about what the user entered
  # at the prompt.
  e <- get("e", parent.frame())
  # Get the expression entered by the user.
  # expr <- e$expr
  # Get the value of the expression entered by the user.
  val <- e$val
  # Return TRUE if even, FALSE if odd.
  return(all(val %% 2 == 0))
}