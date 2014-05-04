local({
  set.seed(13121098)
  n <- 50
  x <- rnorm(n, sd=.5)
  y <- x + rnorm(n, sd=.3)
  out1 <<- data.frame(y=c(5,y), x=c(0,x))
  out2 <<- data.frame(y=c(0,y), x=c(5,x))
})
