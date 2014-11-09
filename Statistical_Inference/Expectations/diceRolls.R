dat <- data.frame(
  x = c(sample(1 : 6, nosim, replace = TRUE),
        apply(matrix(sample(1 : 6, nosim * 2, replace = TRUE), 
                     nosim), 1, mean),
        apply(matrix(sample(1 : 6, nosim * 3, replace = TRUE), 
                     nosim), 1, mean),
        apply(matrix(sample(1 : 6, nosim * 4, replace = TRUE), 
                     nosim), 1, mean)
  ),
  size = factor(rep(1 : 4, rep(nosim, 4))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.25, colour = "black") 
g <- g + facet_grid(. ~ size)
print(g)