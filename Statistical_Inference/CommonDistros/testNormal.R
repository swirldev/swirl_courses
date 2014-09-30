g <- ggplot(data.frame(x = x, y = dnorm(x)), 
              +             aes(x = x, y = y)) + geom_line(size = 2)
g <- g + geom_vline(xintercept = -3 : 3, size = 1)
g
