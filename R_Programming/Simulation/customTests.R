match_call <- function(correct_call = NULL){
  browser()
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correct_call)) return(TRUE)
  # Fills out a function call with full argument names
  match_call <- function(call) {
    qcall <- substitute(call)
    fun <- match.fun(qcall[[1]])
    match.call(fun, qcall)
  }
  # Get full correct call
  full_correct_call <- match_call(correct_call)
  # Get full version of user's expression
  full_user_expr <- match_call(e$expr)
  identical(full_correct_call, full_user_expr)
}
