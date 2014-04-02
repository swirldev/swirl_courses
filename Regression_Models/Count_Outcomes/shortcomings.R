idx <- 1:60
par(mfrow=c(1,2))
plot(visits ~ date, hits[idx,], 
     main='"Zero Inflation" 2011',
     xlab="Date", ylab="Visits", pch=21, bg='green')
lines(hits$date[idx], mdl$fitted.values[idx], lwd=5, col="black")
points(as.Date("2011-01-10"), 5, cex=12, lwd=5)
text(as.Date("2011-01-5"), 9, "Zero Inflation", pos=4)
plot(hits$date, hits$visits-mdl$fitted.values, pch=21, bg='green', main="Variance != Mean?", xlab="Date", ylab="Visits over Average")
lines(hits$date, sqrt(mdl$fitted.values), lwd=5, lty=2, col='black')
lines(hits$date, -sqrt(mdl$fitted.values), lwd=5, lty=2, col='black')
rm(idx)
par(mfrow=c(1,1))
