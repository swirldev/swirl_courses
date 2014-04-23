simbias <- function(){
  temp <- rnorm(100)
  # Point A:
  x1 <- (temp + rnorm(100))/sqrt(2)
  x2 <- (temp + rnorm(100))/sqrt(2)
  # Point B:
  x3 <- rnorm(100)
  # Function to simulate regression of y on 2 variables.
  f <- function(k){
    # Point C:
    y <- x1 + x2 + x3 + .3*rnorm(100)
    # Point D:
    c(lm(y ~ x1 + x2)$coef[2],
       lm(y ~ x1 + x3)$coef[2])
  }
  # Point E:
  sapply(1:150, f)
}

# Have user do this: temp <- simbias()

# wrap this into a function for the user to call
p1 <- hist(temp[1,], plot=FALSE)
p2 <- hist(temp[2,], plot=FALSE)
yrange <- c(0, max(p1$counts, p2$counts))
plot( p1, col=rgb(0,0,1,1/4), xlim=range(temp), ylim=yrange)
plot( p2, col=rgb(1,0,0,1/4), xlim=range(temp), ylim=yrange, add=TRUE)

# R^2 simulation
# temp <- swiss
# for(n in 1:41){temp[,paste0("random",n)] <- rnorm(nrow(temp))}
# f <- function(n){summary(lm(Fertility ~ ., temp[,1:n])$r.squared)}
# r.temp <- sapply(6:46, f)
# plot(r.temp)