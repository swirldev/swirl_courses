min_positive <- function(num_vect) {
  # Check that num_vect is a numeric vector
  if(!is.numeric(num_vect)) {
    stop("Argument 'num_vect' must be a numeric vector!")
  }
  # Get rid of negative numbers
  new_vect <- num_vect(num_vect >= 0)
  # Return minimum of the non-negative numbers
  
}