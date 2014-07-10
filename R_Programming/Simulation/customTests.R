match_call <- function(correct_call = NULL) {
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correct_call)) return(TRUE)
  # Fills out a function call with full argument names
  expand_call <- function(call_string) {
    # Quote expression
    qcall <- parse(text=call_string)[[1]]
    # If expression is not greater than length 1...
    if(length(qcall) <= 1) return(qcall)
    # Get function from function name
    fun <- match.fun(qcall[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Return expanded function call
    match.call(fun, qcall)
  }
  # Get full correct call
  full_correct_call <- expand_call(correct_call)  
  # Expand user's expression
  expr <- deparse(e$expr)
  full_user_expr <- expand_call(expr)
  # Compare function calls with full arg names
  identical(full_correct_call, full_user_expr)
}
