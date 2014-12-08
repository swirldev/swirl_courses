try(dev.off(),silent=TRUE)
local({
  plot(tfc$year, tfc$pv, col=1, pch=19, xlab="Year", ylab="Incumbent Party's Percent", main="Binomial GLM Model with Probabilities\nrather than Binary Outcomes")
  points(tfc$year, fit_pv$fitted.values*100, col=2, pch=17)
  legend('topright', c("Actual Vote", "Model Estimate"), col=1:2, pch=c(19,17))
})