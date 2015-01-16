library(ggplot2)
# Put initialization code in this file.
coinPlot <- function(n){
  means <- cumsum(sample(0 : 1, n , replace = TRUE)) / (1  : n)
  g <- ggplot(data.frame(x = 1 : n, y = means), aes(x = x, y = y)) 
  g <- g + geom_hline(size=1.5 ,yintercept = 0.5,alpha=0.6,
	linetype="longdash") + geom_line(size = 1)
if(n<100){
 	g <- g + geom_point(colour="red",size=3,alpha=0.8)
	}	 
  g <- g + labs(x = "Number of obs", y = "Cumulative mean")
  g <- g + scale_x_continuous(breaks=seq(0,n+1,ceiling(n/10)))
  print(g)
  invisible()
}
