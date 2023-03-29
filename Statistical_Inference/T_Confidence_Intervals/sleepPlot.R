s <- sleep
names(s)[3] = "Patient's ID"
g <- ggplot(data = s , aes(x = group , y = extra, colour = `Patient's ID`))
g <- g + geom_point(size = 7 , alpha = 0.8)
g <- g + geom_line(group = s[,3])
g <- g + xlab('group 1 - group 2 before and after the treatment')
g <- g + ylab('extra hours of sleep after the treatment')
g <- g + theme_bw()
print(g)
