g <- g + geom_area(mapping = aes(x = ifelse(x > -1 & x < 1, x, 0)), fill = "red", alpha = 1)
   scale_y_continuous(limits=c(0,max(dat$y)))
   g <- g + geom_area(mapping = aes(x = ifelse(x > -2 & x < 2, x, 0)), fill = "red", alpha = 0.5)
  g <- g + geom_area(mapping = aes(x = ifelse(x > -3 & x < 3, x, 0)), fill = "red", alpha = 0.35) 

print(g)

