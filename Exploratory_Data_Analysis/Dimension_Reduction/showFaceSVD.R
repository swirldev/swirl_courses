svd1 <- svd(scale(faceData))
par(mar=c(8,8,8,8))
plot(svd1$d^2/sum(svd1$d^2),pch=19,xlab="Singular vector",ylab="Variance explained")
