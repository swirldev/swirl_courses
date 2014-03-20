set.seed(111)
x <- rnorm(1000)
dat <- x
hist(dat, main="Symmetric", xlab="")
abline(v=c(mean(dat), median(dat)), col=(c("blue", "green")), lwd=3)