# Dot plot
plot(cars$price, rep(1, nrow(cars)), ylab="", yaxt="n", xlab="Price ($1000s)",
     xlim=c(5,65))