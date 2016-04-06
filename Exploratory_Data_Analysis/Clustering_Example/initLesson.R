library(fields)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
  "Exploratory_Data_Analysis","Clustering_Example")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
    "Exploratory_Data_Analysis","Clustering_Example",
                      fileName)
}
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
}

myImage <- function(iname){
  par(mfrow=c(1,1))
  par(mar=c(8,10,8,10))
  image(t(iname)[,nrow(iname):1])
}
myedit <- function(fname){
   #fxfer(fname)
   #file.edit(fname)
   mypath <- pathtofile(fname)
   file.edit(mypath)
}

mdist <- function(x,y,cx,cy){
  distTmp <- matrix(NA,nrow=3,ncol=12)
  distTmp[1,] <- (x-cx[1])^2 + (y-cy[1])^2
  distTmp[2,] <- (x-cx[2])^2 + (y-cy[2])^2
  distTmp[3,] <- (x-cx[3])^2 + (y-cy[3])^2  
  return(distTmp)
}

showMe <- function(cv){
  myarg <- deparse(substitute(cv))
  z<- outer( 1:20,1:20, "+")
  obj<- list( x=1:20,y=1:20,z=z )
  image(obj, col=cv, main=myarg  )
}
load(pathtofile("samsungData.rda"))
set.seed(1234);
par(mfrow=c(1, 2), mar = c(5, 4, 1, 1))
ssd <- transform(samsungData, activity = factor(activity))
source(pathtofile("myplclust.R"),local=TRUE)
