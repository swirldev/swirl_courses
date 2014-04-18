galton <- UsingR::galton
est <- function(slope, intercept)intercept + slope*galton$parent
sqe <- function(slope, intercept)sum( (est(slope, intercept)-galton$child)^2)
sltweak <- c(.01, .02, .03, -.01, -.02, -.03)
ictweak <- c(.1, .2, .3, -.1, -.2, -.3)
lhs <- numeric()
rhs <- numeric()
datasets::attenu