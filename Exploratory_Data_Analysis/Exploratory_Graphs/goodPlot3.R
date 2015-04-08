try(dev.off(),silent=TRUE)
par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
plot(west$latitude, west$pm25, main = "West")
