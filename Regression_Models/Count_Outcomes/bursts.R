plot(visits ~ date, hits, pch=21, bg='lightgreen', main="Bursts of Popularity", xlab="Date", ylab="Visits")
points(simplystats ~ date, hits, pch=21, bg='black')
lines(simplystats ~ date, hits, lwd=3)
legend('topleft', c("Visits", "Visits from Simply Statistics"), pch=21, pt.bg=c("lightgreen", "black"), bg="white")
