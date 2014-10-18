x <- seq(-8,8, length = 2000)
dat <- data.frame(x=x, y=dnorm(x,sd=2))
library(ggplot2)
g <- ggplot(dat, aes(x = x, y = y)) + geom_line(size = 1.5)+scale_y_continuous(limits=c(0,max(dat$y)))
suppressWarnings(g <- g+ layer("area",mapping = aes(x=ifelse(x>qnorm(.975,sd=2),x,NA)),
            geom_params=list(fill="red",alpha=.5)) +
   layer("area",mapping = aes(x=ifelse(-9<x & x<qnorm(.025,sd=2),x,NA)),
                                                   geom_params=list(fill="red",alpha=.5)) )
suppressWarnings(print(g))

