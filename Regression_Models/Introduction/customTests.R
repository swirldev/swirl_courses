# Put custom tests in this file.

# So swirl does not repeat execution of plot commands
AUTO_DETECT_NEWVAR <- FALSE

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
  if(exists("galtonexpr", e, inherits=FALSE)){
    for(expr in e$galtonexpr){
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
  if(!exists("galtonexpr", e, inherits=FALSE))e$galtonexpr <- list()
  n <- length(e$galtonexpr)
  e$galtonexpr[[n+1]] <- e$expr
  return(TRUE)
}
