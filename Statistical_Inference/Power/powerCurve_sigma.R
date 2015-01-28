z <- qnorm(.95)
mu0 <- 30
n <- 16
sigseq = c(8, 16, 32, 64, 128)
mua = seq(30, 35, by = 0.1)
power = sapply(sigseq, function(sigma)
  pnorm(mu0 + z * sigma / sqrt(n), mean = mua, sd = sigma / sqrt(n), 
        lower.tail = FALSE)
)
colnames(power) <- paste("sigma", sigseq, sep = "")
d <- data.frame(mua, power)
d2 <- melt(d, id.vars = "mua")
names(d2) <- c("mua", "sigma", "power")    
g <- ggplot(d2, 
            aes(x = mua, y = power, col = sigma)) + geom_line(size = 2)
print(g)            
