  mua <- 32
  mu0 <- 30
  sigma_fat <-8
  n <- 16
  alpha <- .05
  g = ggplot(data.frame(mu = c(27, 36)), aes(x = mu))
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = mu0, sd = sigma_fat / sqrt(n)), 
                        size = 2, col = "red")
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = mua, sd = sigma_fat / sqrt(n)), 
                        size = 2, col = "blue")
  xitc = mu0 + qnorm(1 - alpha) * sigma_fat / sqrt(n)
  g = g + geom_vline(xintercept=xitc, size = 3)
  print(g)

