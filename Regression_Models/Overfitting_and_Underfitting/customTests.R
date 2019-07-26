# So swirl does not repeat execution of plot commands
AUTO_DETECT_NEWVAR <- FALSE

# Returns TRUE if e$expr matches any of the expressions given
# (as characters) in the argument.
ANY_of_exprs <- function(...){
  e <- get("e", parent.frame())
  any(sapply(c(...), function(expr)omnitest(expr)))
}

# Returns TRUE if the user has created a specified lm model
# with a specified name.
creates_lm_model <- function(correctExpr){
  e <- get("e", parent.frame())
  # Do what the user should have done
  eSw <- cleanEnv(e$snapshot)
  mdlSw <- eval(parse(text=correctExpr), eSw)
  # Recreate what the user has done
  eUsr <- cleanEnv(e$snapshot)
  mdlUsr <- eval(e$expr, eUsr)
  # If the correct model is named:
  if(length(ls(eSw))>0){
    # Check whether the model's name is correct
    nameGood <- sum(ls(eUsr) %in% ls(eSw)) & sum(ls(eSw) %in% ls(eUsr))
    # If not, highlight the misspelling
    if(!nameGood){
      swirl_out(paste0("You seem to have misspelled the model's name. I was expecting ", ls(eSw), 
                       " but you apparently typed ", ls(eUsr), "."))
      return(FALSE)
    } else {
      # Append the result, as a list to e$delta for progress restoration
      e$delta <- c(e$delta, as.list(eUsr))
    }
  }
  # Check for effective equality of the models
  isTRUE(all.equal(sort(as.vector(mdlUsr$coefficients)), sort(as.vector(mdlSw$coefficients)))) &
    isTRUE(all.equal(mdlUsr$fitted.values, mdlSw$fitted.values))
}

# The following adds a feature which restores plots and
# other side effects of expressions entered by users.
# It does not preserve plots in their original order,
# because, all plots produced by figure questions are restored
# after plots restored by this code.
#
# A proper fix will require minor changes to the swirl core.
# This hack is here to remind us of the problem's exact nature.

# This function will be called when this file is sourced.
# At that point, e is five frames up in the call stack. 
restore_expr <- function(){
  e <- get("e", parent.frame(5))
  if(exists("plotexpr", e, inherits=FALSE)){
    for(expr in e$plotexpr){
      eval(expr)
    }
  }
}

# Call restore_expr when this file is sourced.
restore_expr()

# This function is a custom test, called whenever it occurs
# as an AnswerTest. At that point, e is one frame up in
# the call stack.
save_expr <- function(){
  e <- get("e", parent.frame())
  if(!exists("plotexpr", e, inherits=FALSE))e$plotexpr <- list()
  n <- length(e$plotexpr)
  e$plotexpr[[n+1]] <- e$expr
  return(TRUE)
}
