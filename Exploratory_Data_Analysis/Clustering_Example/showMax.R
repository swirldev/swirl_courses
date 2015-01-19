par(mfrow=c(1,2))
plot(sub1[,10],pch=19,col=sub1$activity,ylab=names(sub1)[10])
plot(sub1[,11],pch=19,col=sub1$activity,ylab=names(sub1)[11])
par(mfrow=c(1,1))