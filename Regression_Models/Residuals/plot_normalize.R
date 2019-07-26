freqData <- as.data.frame(table(gch_nor, gpa_nor))
names(freqData) <- c("child", "parent", "freq")
plot(as.numeric(as.vector(freqData$parent)), 
     as.numeric(as.vector(freqData$child)), 
     pch = 21, col = "black", bg = "lightblue",
     cex = .07 * freqData$freq, xlab = "parent", ylab = "child")
abline(lm(gch_nor ~ gpa_nor),col="blue",lwd=3)