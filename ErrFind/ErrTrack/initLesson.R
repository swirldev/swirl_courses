library(ggplot2)
library(lattice)
# Put initialization code in this file.
coinPlot <- function(n){
  means <- cumsum(sample(0 : 1, n , replace = TRUE)) / (1  : n)
  g <- ggplot(data.frame(x = 1 : n, y = means), aes(x = x, y = y)) 
  g <- g + geom_hline(yintercept = 0.5) + geom_line(size = 2) 
  g <- g + labs(x = "Number of obs", y = "Cumulative mean")
  print(g)
}