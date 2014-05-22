plot(hunger$Year,hunger$Numeric,pch=19)
points(hunger$Year,hunger$Numeric,pch=19,col=((hunger$Sex=="Male")*1+125))
abline(c(lmInter$coeff[1],lmInter$coeff[2]),col="red",lwd=3)
abline(c(lmInter$coeff[1] + lmInter$coeff[3],lmInter$coeff[2] +lmInter$coeff[4]),col="blue",lwd=3)