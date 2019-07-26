alseq = c(.95, .9, .85, .8)
mua = seq(30, 35, by = 0.1)
z = lapply(alseq, qnorm)
power = sapply(z, function(z)
   pnorm(mu0 + z * sigma / sqrt(n), mean = mua, sd = sigma / sqrt(n), 
        lower.tail = FALSE)
)
colnames(power) <- paste("alpha", 1-alseq, sep = "")
d <- data.frame(mua, power)
d2 <- melt(d, id.vars = "mua")
names(d2) <- c("mua", "alpha", "power")    
g <- ggplot(d2, 
            aes(x = mua, y = power, col = alpha)) + geom_line(size = 2)
print(g)            
