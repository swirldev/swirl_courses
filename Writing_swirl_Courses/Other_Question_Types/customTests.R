# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, expr_creates_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

# Source a file to make custom tests easier to write. Since custom tests operate in
# a subenvironment of the package, source the file locally to remain within
# that subenvironment.
source(file.path(find.package('swirl'), "Courses", "Writing_swirl_Courses", "R", "testAPI.R"), local=TRUE)

# Returns TRUE if the user has entered a numerical value between
# the given limits.
range_test <- function(lower_limit, upper_limit){
  # Using the testAPI, get the value entered
  val <- getVal()
  # Make sure it's numeric
  if(!is.numeric(val))return(FALSE)
  # And of length 1
  if(length(val) != 1)return(FALSE)
  # Return TRUE it val is between the given limits
  lower_limit <= val && val <= upper_limit
}