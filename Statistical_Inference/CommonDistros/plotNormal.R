x <- seq(-4, 4, length = 1000)
dat <- data.frame(x=x, y=dnorm(x))
library(ggplot2)
g <- ggplot(dat, 
              aes(x = x, y = y)) + geom_line(size = 1.5)
g <- g + geom_vline(xintercept = -4 : 4, size = 1)
print(g)
