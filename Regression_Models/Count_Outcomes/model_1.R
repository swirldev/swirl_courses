plot(visits ~ date, hits, 
     main="Visits per Day to the Leek Group Website and\nMean Visits per Day as Estimated by Poisson Regression.",
     xlab="Date", ylab="Visits", pch=21, bg='green')
lines(hits$date, mdl$fitted.values, lwd=5, col="black")
