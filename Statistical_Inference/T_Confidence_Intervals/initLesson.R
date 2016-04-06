# Put initialization code in this file.
data(sleep)
library(ggplot2)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

g1 <- sleep$extra[1 : 10]
g2 <- sleep$extra[11 : 20]
n1 <- length(g1)
n2 <- length(g2)
md <- mean(g2)-mean(g1)
mn <- mean(g2-g1)
#get correct paths for plotting
pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
  	"Statistical_Inference","T_Confidence_Intervals",
                      fileName)
 }
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
  fileName
}