x <- seq(-8,8, length = 2000)
dat <- data.frame(x=x, y=dnorm(x,sd=2))
library(ggplot2)
g <- ggplot(dat, aes(x = x, y = y)) + geom_line(size = 1.5)+scale_y_continuous(limits=c(0,max(dat$y)))
g <- g + geom_ribbon(data = subset(dat,x>qnorm(0.975,sd=2)), mapping = aes(x = x, ymin=0, ymax = y, fill="red",alpha=.5))
g <- g + geom_ribbon(data = subset(dat,x<qnorm(0.025,sd=2)), mapping = aes(x = x, ymin=0, ymax = y, fill="red",alpha=.5))
g <- g + theme(legend.position="none")
suppressWarnings(print(g))

