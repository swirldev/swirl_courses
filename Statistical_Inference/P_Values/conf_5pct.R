x <- seq(-4,4, length = 2000)
dat <- data.frame(x=x, y=dnorm(x))
library(ggplot2)
g <- ggplot(dat, aes(x = x, y = y)) + geom_line(size = 1.5)+scale_y_continuous(limits=c(0,max(dat$y)))
suppressWarnings(g <- g+ layer("area",mapping = aes(x=ifelse(x>qnorm(.95),x,NA)),
            geom_params=list(fill="red",alpha=.5))) 
suppressWarnings(g <- g + geom_line(x=2.0,size=1.5,colour="blue"))
suppressWarnings(print(g))

