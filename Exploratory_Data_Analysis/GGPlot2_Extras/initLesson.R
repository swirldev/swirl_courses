library(ggplot2)
library(datasets)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
	"Exploratory_Data_Analysis","GGPlot2_Part1")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
  	"Exploratory_Data_Analysis","GGPlot2_Extras/",
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

mycuts <- quantile(diamonds$carat,seq(0,1,length=4),na.rm=TRUE)
dc2 <- cut(diamonds$carat,mycuts)
myd <- which(is.na(dc2))
