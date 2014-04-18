#plot(jitter(child,4) ~ parent,galton)
#abline(lm(jitter(child,4)~parent, galton),col="blue",lwd=3)

freqData <- as.data.frame(table(galton$child, galton$parent))
names(freqData) <- c("child", "parent", "freq")
plot(as.numeric(as.vector(freqData$parent)), 
     as.numeric(as.vector(freqData$child)), 
     pch = 21, col = "black", bg = "lightblue",
     cex = .07 * freqData$freq, xlab = "parent", ylab = "child")
abline(lm(jitter(child,4)~parent, galton),col="blue",lwd=3)