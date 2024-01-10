library(fields)
dataFrame <- data.frame(x=x,y=y)
rdistxy <- rdist(dataFrame)
diag(rdistxy) <- diag(rdistxy) + 1e5
try(dev.off(),silent=TRUE)
plot.new()
# Find the index of the points with minimum distance
ind <- which(rdistxy == min(rdistxy),arr.ind=TRUE)
par(mar=rep(0.2,4))
# Plot the points with the minimum overlayed
plot(x,y,col="blue",pch=19,cex=2,asp=1)
text(x+0.05,y+0.05,labels=as.character(1:12))
points(x[ind[1,]],y[ind[1,]],col="orange",pch=19,cex=2)
points(mean(x[ind[1,]]),mean(y[ind[1,]]),col="black",cex=3,lwd=3,pch=3)
points(mean(x[ind[1,]]),mean(y[ind[1,]]),col="orange",cex=5,lwd=3,pch=1)
