points(mean(galton$parent),mean(galton$child),col="purple",lwd=2,pch=2,cex=3.0)
abline(h=mean(galton$child),col="blue",lwd=1.5)
abline(v=mean(galton$parent),col="red",lwd=1.5)