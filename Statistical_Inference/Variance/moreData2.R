dat <- data.frame(
  x = c(apply(matrix(rnorm(nosim * 10), nosim), 1, var),
        apply(matrix(rnorm(nosim * 20), nosim), 1, var)),
  n = factor(rep(c("10", "20"), c(nosim, nosim))) 
)
g <- ggplot(dat, aes(x = x, fill = n)) + geom_density(size = 2, alpha = .4) + geom_vline(xintercept = 1, size = 2) 
print(g)