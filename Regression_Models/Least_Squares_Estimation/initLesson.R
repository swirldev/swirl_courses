# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.
galton <- read.csv(file.path(.get_course_path(),
	"Regression_Models", "Introduction", "galton.csv"))
gch <- galton$child
gpa <- galton$parent
gpa_nor <- (gpa - mean(gpa))/sd(gpa)
gch_nor <- (gch - mean(gch))/sd(gch)
#check to see if using RStudio and if pckg manipulate is available
maniflg <- find.package("manipulate",quiet=TRUE)
if  (isTRUE((Sys.getenv("RSTUDIO") == "1")&&(nchar(maniflg)>0 ))) {
  library(manipulate)
  fname <- file.path(.get_course_path(),
  	"Regression_Models","Least_Squares_Estimation","slopedemo.R")
} else {
  fname <- file.path(.get_course_path(), 
  	"Regression_Models","Least_Squares_Estimation","slopedemo_no_mani.R")  
}
file.edit(fname)
fname2 <- file.path(.get_course_path(),
	"Regression_Models","Least_Squares_Estimation","finalplot.R")
