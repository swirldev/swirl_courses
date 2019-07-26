n <- 20
nosim <- 30
mywald <- function(p){
  phats <- rbinom(nosim, prob = p, size = n) / n
  ll <- phats - qnorm(.975) * sqrt(phats * (1 - phats) / n)
  ul <- phats + qnorm(.975) * sqrt(phats * (1 - phats) / n)
  print("Here are the p\' values")
  print(phats)
  print("Here are the lower")
  print(ll)
  print("Here are the upper")
  print(ul)
  mean(ll < p & ul > p)
}