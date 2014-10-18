# Put initialization code in this file.
library(ggplot2)
fname <- paste(getwd(),"Statistical_Inference/Hypothesis_Testing/father_son.csv",sep="/")
fs <- read.csv(fname)
quants <- c(-1:7)
mybin_g <- pbinom(quants,size=8,p=.5,lower.tail=FALSE)
mybin_l <- pbinom(quants,size=8,p=.5,lower.tail=TRUE)