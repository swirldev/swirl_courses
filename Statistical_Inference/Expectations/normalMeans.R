library(ggplot2)
nosim <- 10000; n <- 10
dat <- data.frame(
  x = c(rnorm(nosim), apply(matrix(rnorm(nosim * n), nosim), 1, mean)),
  what = factor(rep(c("Obs", "Mean"), c(nosim, nosim))) 
)
np <- ggplot(dat, aes(x = x, fill = what)) + geom_density(size = 2, alpha = .2); 
print(np)