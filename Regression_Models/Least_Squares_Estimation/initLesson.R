# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.
galton <- read.csv(file.path(swirl:::swirl_courses_dir(),
	"Regression_Models", "Introduction", "galton.csv"))
gch <- galton$child
gpa <- galton$parent
gpa_nor <- (gpa - mean(gpa))/sd(gpa)
gch_nor <- (gch - mean(gch))/sd(gch)
#check to see if using RStudio and if pckg manipulate is available
maniflg <- find.package("manipulate",quiet=TRUE)
if  (isTRUE((Sys.getenv("RSTUDIO") == "1")&&(nchar(maniflg)>0 ))) {
  library(manipulate)
  fname <- paste(file.path(swirl:::swirl_courses_dir(),
  	"Regression_Models","Least_Squares_Estimation","slopedemo.R",sep="/")
} else {
  fname <- paste(file.path(swirl:::swirl_courses_dir(), 
  	"Regression_Models","Least_Squares_Estimation","slopedemo_no_mani.R",sep="/")  
}
file.edit(fname)
fname2 <- paste(file.path(swirl:::swirl_courses_dir(),
	"Regression_Models","Least_Squares_Estimation","finalplot.R",sep="/")