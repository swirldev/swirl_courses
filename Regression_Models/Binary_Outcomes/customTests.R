# So swirl does not repeat execution of plot commands
AUTO_DETECT_NEWVAR <- FALSE

# Returns TRUE if e$val is identical to the value that would
# have been created by the correct expression.
creates_val_identical_to <- function(correctExpr){
  e <- get("e", parent.frame())
  correctVal <- eval(parse(text=correctExpr), cleanEnv(e$snapshot))
  results <- expectThat(e$val,
                        is_identical_to(correctVal, label=correctExpr),
                        label=deparse(e$expr))
  return(results$passed)
}

# Returns TRUE if the user has created a specified glm model.
creates_glm_model <- function(correctExpr){
  e <- get("e", parent.frame())
  mdl <- e$val
  cmdl <- eval(parse(text=correctExpr), cleanEnv(e$snapshot))
  all.equal(mdl$coefficients, cmdl$coefficients) &
    mdl$family$family == cmdl$family$family &
    identical(mdl$data, cmdl$data)
}

# Returns TRUE if e$expr matches any of the expressions given
# (as characters) in the argument.
ANY_of_exprs <- function(...){
  e <- get("e", parent.frame())
  any(sapply(c(...), function(expr)omnitest(expr)))
}