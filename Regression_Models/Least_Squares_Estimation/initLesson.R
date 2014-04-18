# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.
galton <- UsingR::galton
gch <- galton$child
gpa <- galton$parent
gpa_nor <- (gpa - mean(gpa))/sd(gpa)
gch_nor <- (gch - mean(gch))/sd(gch)
fname <- paste(getwd(),"Regression_Models","Least_Squares_Estimation","slopedemo.R",sep="/")
file.edit(fname)
fname2 <- paste(getwd(),"Regression_Models","Least_Squares_Estimation","finalplot.R",sep="/")