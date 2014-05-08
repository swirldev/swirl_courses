# Make a formula of the type outcome ~ 0 + predictor.
# The zero suppresses the intercept unless 1 is explicitly
# given as the predictor.
makeFormula <- function(outcome, predictor){
  paste0(outcome, " ~ 0 + ", predictor)
}

# Return a linear regression of the outcome against the
# predictor, suppressing the intercept unless it is 
# specifically given.
regress <- function(outcome, predictor, dataframe){
  lm(makeFormula(outcome, predictor), dataframe)
}

# Eliminate the specified predictor from the dataframe by
# regressing all other variables on that predictor
# and returning a data frame containing the residuals
# of those regressions.
eliminate <- function(predictor=1, dataframe){
  outcomes <- setdiff(names(dataframe), predictor)
  temp <- sapply(outcomes, function(outcome)resid(regress(outcome, predictor, dataframe)))
  names(temp) <- outcomes
  as.data.frame(temp)
}
