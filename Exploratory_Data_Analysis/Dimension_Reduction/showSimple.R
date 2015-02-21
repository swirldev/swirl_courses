par(mfrow=c(1,3))
image(t(constantMatrix)[,nrow(constantMatrix):1])
plot(svd2$d,xlab="Column",ylab="Singular value",pch=19)
plot(svd2$d^2/sum(svd2$d^2),xlab="Column",ylab="Prop. of variance explained",pch=19)