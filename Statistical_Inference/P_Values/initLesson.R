# Put initialization code in this file.
library(ggplot2)
#get correct paths for plotting
pathtofile <- function(fileName){
  mypath <- file.path(find.package("swirl"),
                      "Courses/Statistical_Inference/P_Values",
                      fileName)
}
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
  fileName
}
#fname <- paste(getwd(),"Statistical_Inference/Hypothesis_Testing/father_son.csv",sep="/")
fname <- pathtofile("father_son.csv")
fs <- read.csv(fname)
quants <- c(-1:7)
mybin <- pbinom(quants,size=8,p=.5,lower.tail=FALSE)
