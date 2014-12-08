try(dev.off(),silent=TRUE)
local({
  fit <- 51.3 + 0.1*tfc$approval + 0.6*tfc$q2 - 4.1*tfc$tfc
  plot(tfc$year, tfc$pv, col=1, pch=19, xlab="Year", ylab="Incumbent Party's Percent", main="The Time for Change Model")
  points(tfc$year, fit, col=2, pch=17)
  legend('topright', c("Actual Vote", "TFC Estimate"), col=1:2, pch=c(19,17))
})
