runTest <- function(...)UseMethod("runTest")

runTest.exact <- function(keyphrase,e){
  is.correct <- FALSE
  if(is.numeric(e$val)){
    correct.ans <- eval(parse(text=rightside(keyphrase)))
    epsilon <- 0.01*abs(correct.ans)
    is.correct <- abs(e$val-correct.ans) <= epsilon
  }
  return(isTRUE(is.correct))
}

# Returns TRUE if as.expression
# (e$expr) matches the expression indicated to the right
# of "=" in keyphrase
# keyphrase:equivalent=expression
runTest.equivalent <- function(keyphrase,e) {
  return(omnitest(rightside(keyphrase)))
}
