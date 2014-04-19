galton <- UsingR::galton
est <- function(slope, intercept)intercept + slope*galton$parent
sqe <- function(slope, intercept)sum( (est(slope, intercept)-galton$child)^2)
fname <- paste(getwd(),"Regression_Models","Residuals_Variation","demofile.R",sep="/")