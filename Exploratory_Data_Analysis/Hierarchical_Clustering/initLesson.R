library(ggplot2)
library(fields)

# Put initialization code in this file.
path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Hierarchical_Clustering")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(find.package("swirl"),
                      "Courses/Exploratory_Data_Analysis/Hierarchical_Clustering/",
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
set.seed(1234);
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
dataFrame <- data.frame(x=x,y=y)
distxy <- dist(x,y)
xsm <- c(x[4],x[8],x[11])
ysm <- c(y[4],y[8],y[11])
dFsm <- data.frame(x=xsm,y=ysm)
