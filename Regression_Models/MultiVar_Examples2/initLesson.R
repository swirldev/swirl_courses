# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.
library(datasets); 
data(InsectSprays); 
require(stats); 
require(graphics)

boxplot(count ~ spray, data = InsectSprays,
        xlab = "Type of spray", ylab = "Insect count",
        main = "InsectSprays data", varwidth = TRUE, col = "lightgray")

# Put initialization code in this file.
# file.copy(from=file.path(find.package("swirl"),
#                          "Courses/Regression_Models",
#                          "MultiVar_Examples2/swissLMs.R"), 
#           to="swissLMs.R")
# file.edit("swissLMs.R")
# source("swissLMs.R", globalenv())

# if  ((Sys.getenv("RSTUDIO") == "1")&&(nchar(maniflg)>0 )){
#   library(manipulate)
#   fname <- paste(getwd(),"Regression_Models","Least_Squares_Estimation","slopedemo.R",sep="/")
# } else {
#   fname <- paste(getwd(),"Regression_Models","Least_Squares_Estimation","slopedemo_no_mani.R",sep="/")  
# }
# file.edit(fname)
# fname2 <- paste(getwd(),"Regression_Models","Least_Squares_Estimation","finalplot.R",sep="/")