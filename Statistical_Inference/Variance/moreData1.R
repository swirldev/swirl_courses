nosim <- 10000; 
dat <- data.frame(
  x = c(apply(matrix(rnorm(nosim * 10), nosim), 1, var)),
  n = factor(rep(c("10"), c(nosim))) 
)
g <- ggplot(dat, aes(x = x, fill = n)) + geom_density(size = 2, alpha = .6) + geom_vline(xintercept = 1, size = 2) 
print(g)