plot(x, y, lwd = 3, frame = FALSE, type = "l")
segments(0,0,2,1,lwd=3)
#polygon(c(.5,1.5,1.5,.5,.5),c(0,0,.75,.25,0),lwd= 3, col = "lightblue")
polygon(c(0,1.6,1.6,0),c(0,0,.8,0),lwd=3,col="lightblue")
mypdf <- function(x){x/2}
#polygon(c(0,.6,.6,0),c(0,0,.3,0),lwd=3, col="lightblue")