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

