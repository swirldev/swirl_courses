x <- numeric(3)
y <- numeric(3)
x[1] <- mean(galton$parent) 
y[1] <- x[1]*.646 + 23.94153
x[2] <- x[1]-1; y[2] <- y[1]
x[3] <- x[2]; y[3] <- y[2]-.646
segments(x[1],y[1],x[2],y[2],col='purple',lwd=4)
segments(x[2],y[2],x[3],y[3],col='purple',lwd=4)
segments(x[1],y[1],x[3],y[3],col='purple',lwd=4)
