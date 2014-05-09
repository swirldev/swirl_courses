# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.
galton <- UsingR::galton
gch <- galton$child
gpa <- galton$parent
gpa_nor <- (gpa - mean(gpa))/sd(gpa)
gch_nor <- (gch - mean(gch))/sd(gch)
#check to see if using RStudio and if pckg manipulate is available
maniflg <- find.package("manipulate",quiet=TRUE)
if  ((Sys.getenv("RSTUDIO") == "1")&&(nchar(maniflg)>0 )){
  library(manipulate)
  fname <- paste(find.package("swirl"),"Courses/Regression_Models","Least_Squares_Estimation","slopedemo.R",sep="/")
} else {
  fname <- paste(find.package("swirl"),"Courses/Regression_Models","Least_Squares_Estimation","slopedemo_no_mani.R",sep="/")  
}
file.edit(fname)
fname2 <- paste(find.package("swirl"),"Courses/Regression_Models","Least_Squares_Estimation","finalplot.R",sep="/")