g <- ggplot(dat, aes(x = x, y = y)) + geom_line(size = 1.5)
g <- g + geom_ribbon(aes(x = ifelse(x > -1 & x < 1, x, 0), ymin = 0, ymax = dat$y), fill = "red", alpha = 1)
g <- g +  geom_ribbon(aes(x = ifelse(x > -2 & x < 2, x, 0), ymin = 0, ymax = dat$y), fill = "red", alpha = 0.5)
g <- g +  geom_ribbon(aes(x = ifelse(x > -3 & x < 3, x, 0), ymin = 0, ymax = dat$y), fill = "red", alpha = 0.35)
print(g)

