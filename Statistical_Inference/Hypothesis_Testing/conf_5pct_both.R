x <- seq(-8, 8, length = 2000)
dat <- data.frame(x = x, y = dnorm(x, sd = 2))
library(ggplot2)
g <- ggplot(dat, aes(x = x, y = y)) + geom_line(size = 1.5)+
        scale_y_continuous(limits = c(0, max(dat$y)))
p.level <- 0.975
shade.start <- qnorm(p.level, sd = 2)
y.up <- dnorm(shade.start, max(dat$x), 2)
area.shade <- rbind(c(shade.start, 0), subset(dat, x >
        shade.start), c(dat[nrow(dat), "x"], 0))
suppressWarnings(g <- g + geom_segment(aes(x = shade.start,
        y = 0,xend = shade.start, yend = y.up)) + 
        geom_polygon(data = area.shade, fill = "red", aes(x, y)))
p.level <- 0.025
shade.start <- qnorm(p.level, sd = 2)
y.up <-dnorm(shade.start, min(dat$x), 2)
area.shade <- rbind(c(shade.start, 0), subset(dat, x <
        shade.start))
suppressWarnings(g <- g + geom_segment(aes(x = shade.start,
        y = y.up, xend = -8, yend = 0), linetype = 0) +
        geom_polygon(data = area.shade,
        fill = "red", linetype = 0, aes(x, y)))
suppressWarnings(print(g))
