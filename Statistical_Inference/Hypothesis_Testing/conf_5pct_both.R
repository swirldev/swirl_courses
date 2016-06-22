x <- seq(-8,8, length = 2000)
dat <- data.frame(x=x, y=dnorm(x))
library(ggplot2)
g <- ggplot(dat, aes(x = x, y = y)) + geom_line(size = 1.5) + xlim(-4, 4) + scale_y_continuous(limits=c(0,max(dat$y)))
suppressWarnings(g <- g+ layer("area", stat="identity", position="identity",mapping = aes(x=ifelse(x>qnorm(.975),x,NA)),
            params=list(fill="red",alpha=.5, na.rm=TRUE)) +
   layer("area", stat="identity", position="identity",mapping = aes(x=ifelse(-9<x & x<qnorm(.025),x,NA)),
                                                   params=list(fill="red",alpha=.5, na.rm=TRUE)) )
suppressWarnings(print(g))

