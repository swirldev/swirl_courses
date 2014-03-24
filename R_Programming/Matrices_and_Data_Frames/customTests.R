# Put custom tests in this file.

creates_val_identical_to <- function(correctExpr){
  e <- get("e", parent.frame())
  correctVal <- eval(parse(text=correctExpr), cleanEnv(e$snapshot))
  results <- expectThat(e$val,
                        is_identical_to(correctVal, label=correctExpr),
                        label=deparse(e$expr))
  return(results$passed)
}