# some plots
par(mfrow = c(1, 2))
plot(c(-0.25, 0, 2, 2, 2.25), c(0, 0, 1, 0, 0), type = "l", lwd = 3, frame = FALSE, xlab="", ylab = ""); title('f(t)')
my_x <- seq(0,2,by=.1)
my_y <- my_x^2/2
plot(my_y ~ my_x, type = "l", lwd = 3, frame = FALSE, xlab="", ylab = ""); title('t f(t)')
abline(v=2.0, lwd=3)
myfunc <- function(x){x^2/2}
