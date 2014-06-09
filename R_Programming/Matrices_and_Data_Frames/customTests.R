
# Put custom tests in this file.

expr_creates_var <- function(correctName=NULL){
  e <- get("e", parent.frame())
  # TODO: Eventually make auto-detection of new variables an option.
  # Currently it can be set in customTests.R
  delta <- if(!customTests$AUTO_DETECT_NEWVAR){
    safeEval(e$expr, e)
  } else {
    e$delta
  }
  if(is.null(correctName)){
    results <- expectThat(length(delta) >= 1,
                          is_true(),
                          label=paste(deparse(e$expr), 
                                      "does not create a variable."))  
  } else {
    results <- expectThat(correctName %in% names(delta), 
                          is_true(), 
                          label=paste(deparse(e$expr),
                                      "does not create a variable named",
                                      correctName))
  }
  if(results$passed){
    e$newVar <- e$val
    e$newVarName <- names(delta)[1]
    e$delta <- mergeLists(delta, e$delta)
  } else if(is(e,"dev")){
    swirl_out(results$message)
  }
  return(results$passed)
}

creates_val_identical_to <- function(correctExpr){
  e <- get("e", parent.frame())
  correctVal <- eval(parse(text=correctExpr), cleanEnv(e$snapshot))
  results <- expectThat(e$val,
                        is_identical_to(correctVal, label=correctExpr),
                        label=deparse(e$expr))
  return(results$passed)
}