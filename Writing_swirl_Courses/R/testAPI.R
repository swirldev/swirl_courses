# This is a test API prototype.

# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Get the last expression which the user entered at the R console.
getExpr <- function(){
  getState()$expr
}

# Get the names of variables created so far in the swirl lesson and
# which were saved in a protected environment for later use.
getVariableNames <- function(){
  names(getState()$snapshot)
}

# Get the saved value of a variable created earlier in a swirl lesson.
getVariable <- function(name_of_variable){
  stored <- getState()$snapshot
  name_of_variable <- as.character(name_of_variable)
  stored[[name_of_variable]]
}

# Remove a variable created earlier in a swirl lesson. This ability is useful
# for removing large variables which affect swirl's performance. It
# will not raise an error if the variable does not exist, but will return
# FALSE rather than TRUE.
removeVariable <- function(name_of_variable){
  snapshot <- getState()$snapshot
  if(!exists(name_of_variable, snapshot, inherit=FALSE))return(FALSE)
  survivors <- setdiff(names(snapshot), name_of_variable)
  getState()$snapshot <- snapshot[survivors]
}

# Stage a variable for inclusion is swirl's protected list. Staged variables
# will be included if and only if a user's answer passes all the current tests.
stageVariable <- function(name_of_variable, value){
  name_of_variable <- as.character(name_of_variable)
  e <- getState()
  e$delta[[name_of_variable]] <- value
}

# Get a copy of the list of staged variables.
getStagedVariables <- function(){
  getState()$delta
}

# Returns the current question (or text, figure, or whatnot) as a named list.
# This enables, for instance, access to the correct answer: currentQuestion()$CorrectAnswer.
getCurrentQuestion <-  function(){
  as.list(getState()$current.row)
}

# Returns the number of the current question.
getCurrentQuestionNumber <- function(){
  getState()$row
}

# Creates custom storage for course author's use. As a part of swirl's state, it will
# persist through swirl sessions and be saved to the hard drive aperiodically. An error 
# will be raised if the given name conflicts with another in swirl's state. Custom storage
# might be used to record performance statistics, for instance.
createCustomStore <- function(name_of_store){
  if(name_of_store %in% names(getState()))stop(paste(name_of_store, "is already in use. Use a different name."))
  assign(name_of_store, list(), getState())
}

# Creates a name:value pair in custom storage of the given name, creating the storage
# first if necessary.
store <- function(name_of_variable, value_of_variable, name_of_store){
  if(!exists(name_of_store, getState(), inherits=FALSE))createCustomStore(name_of_store)
  e <- getState()
  store <- get(name_of_store, e)
  store[[name_of_variable]] <- value_of_variable
  assign(name_of_store, store, e)
}

# Retrieves a value from custom storage, or returns NA if no such variable or store exists.
retrieve <- function(name_of_variable, name_of_store){
  e <- getState()
  if(!exists(name_of_store, e, inherits=FALSE))return(NA)
  store <- get(name_of_store, e, inherits=FALSE)
  if(!exists(name_of_variable, store))return(NA)
  store[[name_of_variable]]
}