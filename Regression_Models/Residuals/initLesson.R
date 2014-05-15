galton <- UsingR::galton
est <- function(slope, intercept)intercept + slope*galton$parent
sqe <- function(slope, intercept)sum( (est(slope, intercept)-galton$child)^2)
datasets::attenu
fname <- paste(find.package("swirl"),"Courses/Regression_Models","Residuals","res_eqn.R",sep="/")
