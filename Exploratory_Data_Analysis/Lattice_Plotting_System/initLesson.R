library(lattice)
library(datasets)

# Put initialization code in this file.
path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Lattice_Plotting_System")
try(dev.off(),silent=TRUE)
dev.set(2)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(find.package("swirl"),
                      "Courses/Exploratory_Data_Analysis/Lattice_Plotting_System/",
                      fileName)
}
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
}

mytrellis <- xyplot(Ozone ~ Wind, data=airquality)
mynames <- names(mytrellis)
myfull <- sapply(mynames, function(nn) !is.null(mytrellis[[nn]]))

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x+ rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
#xyplot(y ~ x | f, layout = c(2, 1))  ## Plot with 2 panels
rx1 <- range(x[1:50])
rx2 <- range(x[51:100])
ry1 <- range(y[1:50])
ry2 <- range(y[51:100])
v1 <- c(rx1,ry1)
v2 <- c(rx2,ry2)

myedit <- function(fname){
   #fxfer(fname)
   #file.edit(fname)
   mypath <- pathtofile(fname)
   file.edit(mypath)
}
