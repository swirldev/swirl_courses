ACCompar <- function(n){
 num <- 1:n 
 den <- n
 nn <- num+2
 nd <- den+4
 nf <- nn/nd
 of <- num/den
 scor <- nf<of
 print(scor)
 sum(scor)
}