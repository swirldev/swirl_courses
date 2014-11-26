library(ggplot2)
# Put initialization code in this file.
pollution <- read.csv("avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
high <- pollution$pm25[pollution$pm25>15]
low <- pollution$pm25[pollution$pm25<5]
plot.new()