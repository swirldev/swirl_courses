# Put initialization code in this file.
library(ggplot2)
fname <- paste(getwd(),"Statistical_Inference/Hypothesis_Testing/father_son.csv",sep="/")
fs <- read.csv(fname)
mybin <- function{
  rbind(
    pbinom(-1, size = 8, p = .5, lower.tail = FALSE),
    pbinom( 0, size = 8, p = .5, lower.tail = FALSE),
    pbinom( 1, size = 8, p = .5, lower.tail = FALSE),
    pbinom( 2, size = 8, p = .5, lower.tail = FALSE),
    pbinom( 3, size = 8, p = .5, lower.tail = FALSE),
    pbinom( 4, size = 8, p = .5, lower.tail = FALSE),
    pbinom( 5, size = 8, p = .5, lower.tail = FALSE),
    pbinom( 6, size = 8, p = .5, lower.tail = FALSE),
    pbinom( 7, size = 8, p = .5, lower.tail = FALSE)
)
}