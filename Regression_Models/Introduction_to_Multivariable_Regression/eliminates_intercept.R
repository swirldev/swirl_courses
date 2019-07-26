local({
  freqData <- as.data.frame(table(galton$child-mean(galton$child), galton$parent-mean(galton$parent)))
  names(freqData) <- c("child", "parent", "freq")
  plot(as.numeric(as.vector(freqData$parent)), 
       as.numeric(as.vector(freqData$child)), 
       pch = 21, col = "black", bg = "lightblue",
       cex = .07 * freqData$freq, xlab = "parent-mean(parent)", ylab = "child-mean(child)",
       main="Subtracting the means eliminates the intercept.")
  abline(lm(I(child-mean(child)) ~ I(parent-mean(parent)) - 1, galton),col="blue",lwd=3)
  abline(h=0, lwd=2)
  abline(v=0, lwd=2)
  text(0, .6, "The intercept is 0", col='red', pos=2)
  points(rep(0,3), rep(0,3), cex=2:4, lwd=2, col='red')
})