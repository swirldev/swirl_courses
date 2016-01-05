x <- seq(-4, 4, length = 1000)
dat <- data.frame(x=x, y=dnorm(x))
g <- ggplot(dat, aes(x = x, y = y)) + geom_line(size = 1.5)
g <- g + geom_ribbon(aes(x = ifelse(x > -1 & x < 1, x, 0), ymin = 0, ymax = dat$y), fill = "red", alpha = 1)
g <- g +  geom_ribbon(aes(x = ifelse(x > -2 & x < 2, x, 0), ymin = 0, ymax = dat$y), fill = "red", alpha = 0.5)
print(g)

