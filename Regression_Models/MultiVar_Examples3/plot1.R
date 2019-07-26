plot(hunger$Year,hunger$Numeric,type="n")
points(hunger$Year,hunger$Numeric,pch=19,col=((hunger$Sex=="Female")*1+125))
lines(hunger$Year[hunger$Sex=="Male"],lmM$fitted,col="blue",lwd=3)
lines(hunger$Year[hunger$Sex=="Female"],lmF$fitted,col="red",lwd=3)

