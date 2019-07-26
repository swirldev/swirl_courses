plot(visits ~ date, hits, main="Visits per Day to the Leek Group Website.", xlab="Date", ylab="Visits", pch=21, bg='green')
lines(hits$date, predict(loess(visits ~ julian(date), hits, span=1.5)), lwd=5, col="black")
