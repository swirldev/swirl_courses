mycdf <- function(x){x*x/4}
plot(x <- mycdf(0:10),type='l',xlab="x",ylab="(x/2)^2",main="CDF")
