nosim <- 1000
cfunc <- function(x, n) mean(x)
g1 = ggplot(data.frame(y = rep(1/6, 6), x = 1 : 6), aes(y = y, x = x))
g1 = g1 + geom_bar(stat = "identity", fill = "lightblue", colour = "black")
#print(g1)
dat <- data.frame(x = apply(matrix(sample(1 : 6, nosim * 50, replace = TRUE), 
                                   nosim), 1, mean))
g2 <- ggplot(dat, aes(x = x)) + geom_histogram(binwidth=.2, colour = "black", fill = "salmon", aes(y = ..density..)) 
print(g2)
#grid.arrange(g1, g2, ncol = 2)

