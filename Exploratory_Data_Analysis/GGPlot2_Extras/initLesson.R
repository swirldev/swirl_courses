library(ggplot2)
library(datasets)

# Put initialization code in this file.
path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/GGPlot2_Part1")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(find.package("swirl"),
                      "Courses/Exploratory_Data_Analysis/GGPlot2_Part1/",
                      fileName)
}
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
}



myedit <- function(fname){
   #fxfer(fname)
   #file.edit(fname)
   mypath <- pathtofile(fname)
   file.edit(mypath)
}
brk <- numeric()
for (n in 0:31) brk[n+1] <- (n*617)
myhist <- hist(diamonds$price,breaks=brk,plot=FALSE)
counts <- myhist$counts

