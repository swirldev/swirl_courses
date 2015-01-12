constantMatrix <- dataMatrixOrdered*0
for(i in 1:dim(dataMatrixOrdered)[1]){constantMatrix[i,] <- rep(c(0,1),each=5)}
svd2 <- svd(constantMatrix)
par(mfrow=c(1,3))
image(t(constantMatrix)[,nrow(constantMatrix):1])
plot(svd2$d,xlab="Column",ylab="Singular value",pch=19)
plot(svd2$d^2/sum(svd2$d^2),xlab="Column",ylab="Prop. of variance explained",pch=19)