# Put initialization code in this file.
data(sleep)
g1 <- sleep$extra[1 : 10]; 
g2 <- sleep$extra[11 : 20]
n1 <- length(g1)
n2 <- length(g2)
md <- mean(g2)-mean(g1)