# Make a formula for regressing the outcome against
# the predictor, suppressing the intercept except
# in the special case for predictor = 1.
makeFormula <- function(outcome, predictor){
  if(predictor!=1){
    paste0(outcome, " ~ ", predictor, "- 1")
  } else {
    paste0(outcome, "~ 1")
  }
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
  others <- setdiff(names(dataframe), predictor)
  temp <- sapply(others, function(other)resid(regress(other, predictor, dataframe)))
  names(temp) <- others
  as.data.frame(temp)
}

# Given a predictor and its known coefficient subtract
# the coefficient times the predictor from the outcome,
# remove the predictor from the data frame and return
# the result.
reduce <- function(outcome, predictor, coefficient, dataframe){
  if(predictor==1){
    dataframe[, outcome] <- dataframe[, outcome] - coefficient*1
  } else {
    dataframe[, outcome] <- dataframe[, outcome] - coefficient*dataframe[, predictor]
  }
  dataframe[, setdiff(names(dataframe), predictor)]
}