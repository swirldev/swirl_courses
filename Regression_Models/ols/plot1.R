plot(jitter(child,4) ~ parent,galton)
abline(lm(jitter(child,4)~parent, galton),col="blue",lwd=3)