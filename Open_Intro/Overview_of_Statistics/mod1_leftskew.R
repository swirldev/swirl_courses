set.seed(111)
x <- abs(rnorm(1000))
dat <- 2.5-x
hist(dat, main="Left Skew", xlab="")
abline(v=c(mean(dat), median(dat)), col=(c("blue", "green")), lwd=3)