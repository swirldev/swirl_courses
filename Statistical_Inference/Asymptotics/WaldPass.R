n <- 100; pvals <- seq(.1, .9, by = .05); nosim <- 1000
coverage <- sapply(pvals, function(p){
  phats <- rbinom(nosim, prob = p, size = n) / n
  ll <- phats - qnorm(.975) * sqrt(phats * (1 - phats) / n)
  ul <- phats + qnorm(.975) * sqrt(phats * (1 - phats) / n)
  mean(ll < p & ul > p)
})

g <- ggplot(data.frame(pvals, coverage), aes(x = pvals, y = coverage)) 
g<- g + geom_line(size = 1) + geom_hline(yintercept = 0.95,linetype="longdash",colour="red")
g<- g + scale_x_continuous(breaks = seq(0,1,0.1)) + ylim(0.75,1)
print(g)

