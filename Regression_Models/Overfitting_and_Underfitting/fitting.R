simdata <- {
  temp <- rnorm(100)
  x1 <- (temp + rnorm(100))/sqrt(2)
  x2 <- (temp + rnorm(100))/sqrt(2)
  x3 <- rnorm(100)
  y <- x1 + x2 + x3 + rnorm(100)
  data.frame(y=y, x1=x1, x2=x2, x3=x3)
}
# coef(y ~ 0 + x1 + x2 + x3) etc.