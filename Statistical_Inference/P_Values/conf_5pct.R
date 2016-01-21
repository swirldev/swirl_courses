x <- seq(-4,4, length = 2000)
dat <- data.frame(x=x, y=dnorm(x))
library(ggplot2)
g <- ggplot(dat, aes(x = x, y = y)) + geom_line(size = 1.5) +
        scale_y_continuous(limits=c(0,max(dat$y)))
p.level <- 0.95
shade.start <- qnorm(p.level, sd = 1)
y.up <-dnorm(shade.start, max(dat$x), 1)
area.shade <- rbind(c(shade.start, 0), subset(dat, x >
        shade.start), c(dat[nrow(dat), "x"], 0))
suppressWarnings(g <- g + geom_segment(aes(x = shade.start,y = 0,
        xend = shade.start, yend=y.up), linetype = 0) +
        geom_polygon(data = area.shade, fill = "red", aes(x, y)))
suppressWarnings(g <- g + geom_line(x=2.0,size=1.5,colour="blue"))
suppressWarnings(print(g))
