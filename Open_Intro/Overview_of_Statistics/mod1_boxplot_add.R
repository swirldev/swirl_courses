sum <- summary(cars$price[cars$type=="midsize"])
abline(h=c(sum[2],sum[5]), col=c("blue","green"), lwd=3)