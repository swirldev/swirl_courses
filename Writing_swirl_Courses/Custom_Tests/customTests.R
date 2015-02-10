# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, expr_creates_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

# Source file testAPI.R which is designed to make custom tests easier to write.
# Since custom tests operate in a subenvironment of the swirl package, source the 
# file locally to remain within that subenvironment.
source(file.path(find.package('swirl'), "Courses", "Writing_swirl_Courses", "R", "testAPI.R"), 
       local=TRUE)

# This custom "test" uses the test API to list names of variables staged for inclusion
# in swirl's protected list of variables. Variables included in this list persist 
# for use in future questions, even if accidentally removed from the workspace.
# Staged variables will be included in the protected list only if a user answers
# the question correctly.
display_staged_variables <- function(){
  if(length(getStagedVariables()) == 0){
    message("*****There are no staged variables.*****")
  } else {
    # getStagedVariables() is from the test API
    message(paste("*****Staged Variables:", names(getStagedVariables()), "*****"))
  }
  return(TRUE)
}

# This custom test checks whether a student has used the assignment operator, <- or ->, to
# assign a given value to a variable of the given name.
test_assignment <- function(variable_name, variable_value){
  # Get the expression which the user has entered (using testAPI)
  expr <- getExpr()
  # Get the value computed by the expression (using testAPI)
  val <- getVal()
  # An R expression is an object which has been parsed and is ready to be evaluated.
  # It can be treated as a list. In the case of simple assignment it will be a list
  # of 3 objects, the assignment operator '<-' itself, the name of the variable assigned,
  # and the value assigned to it. Both forms of assignment, y <- 1:10 and 1:10 -> y, 
  # parse to the same expression. Here we check if the expression is an assignment, 
  # whether the assigned name is correct, and whether the assigned value is correct.
  pass <- is(expr, '<-') & expr[[2]] == variable_name & isTRUE(all.equal(val, variable_value))
  if(pass){
    # Stage the variable and its value for inclusion in swirl's state (using testAPI)
    stageVariable(expr[[2]], val)
    # Return TRUE indicating the test was passed
    return(TRUE)
  } else {
    # Return FALSE indicating failure
    return(FALSE)
  }
}

# This custom test checks for assignment but allows the user to choose the
# variable's name.
test_assignment_but_not_name <- function(variable_value){
  # Get the expression which the user has entered (using testAPI)
  expr <- getExpr()
  # Get the value computed by the expression (using testAPI)
  val <- getVal()
  # Check for assignment and correct value, but drop requirement for a
  # particular name.
  pass <- is(expr, '<-') & isTRUE(all.equal(val, variable_value))
  if(pass){
    # Stage the variable and its value for inclusion in swirl's state (using testAPI)
    stageVariable(expr[[2]], val)
    # Store the name which the user has chosen for the author's later reference, using
    # the test API.
    store("user_chosen_name", expr[[2]], "authors_private_store")
    # Return TRUE indicating the test was passed
    return(TRUE)
  } else {
    # Return FALSE indicating failure
    return(FALSE)
  }
}

test_square_of_user_named_variable <- function(){
  # Retrieve variable just created from author's store.
  var_name <- retrieve("user_chosen_name", "authors_private_store")
  # Get its value from swirl's internal state. Recall the variable and
  # its value were staged for inclusion in a previous question.
  var_value <- getVariable(var_name)
  # Pass the saved name and the square of its value to test_assignment
  test_assignment(var_name, var_value^2)
}