dat <- data.frame(
  x = c(apply(matrix(rnorm(nosim * 10), nosim), 1, var),
        apply(matrix(rnorm(nosim * 20), nosim), 1, var),
        apply(matrix(rnorm(nosim * 30), nosim), 1, var)),
  n = factor(rep(c("10", "20", "30"), c(nosim, nosim, nosim))) 
)
g <- ggplot(dat, aes(x = x, fill = n)) + geom_density(size = 2, alpha = .2) + geom_vline(xintercept = 1, size = 2) 
print(g)