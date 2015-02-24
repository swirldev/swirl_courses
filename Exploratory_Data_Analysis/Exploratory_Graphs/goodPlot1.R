try(dev.off(),silent=TRUE)
par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
hist(east$pm25, col = "green")