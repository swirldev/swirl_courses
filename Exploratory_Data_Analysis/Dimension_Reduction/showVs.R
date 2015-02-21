svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,3))
par(mar=c(5,4,4,2))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd2$v[,1],pch=19,xlab="Index",ylab="First right singular vector")
title(main="v and variation in columns")
plot(svd2$v[,2],pch=19,xlab="Index",ylab="Second right singular vector")

