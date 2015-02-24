try(dev.off(),silent=TRUE)
par(mfrow=c(1,2))
plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")
plot(airquality$Wind, airquality$Solar.R, main = "Ozone and Solar Radiation")
