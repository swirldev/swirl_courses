library(fields)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
  "Exploratory_Data_Analysis","Dimension_Reduction")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
    "Exploratory_Data_Analysis","Dimension_Reduction",
                      fileName)
}
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
}

myImage <- function(iname){
  par(mfrow=c(1,1))
  par(mar=c(4,5,4,5))
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
set.seed(12345); 
dataMatrix <- matrix(rnorm(400),nrow=40)
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]

mat <- matrix(c(1,2,2,5,3,7),nrow=2)
msvd <- svd(mat)
smsvd <- svd(scale(mat))
diag <- matrix(c(0,0,0,0),nrow=2)
sdiag <- diag
for (i in 1:2) diag[i,i] <- msvd$d[i]
for (i in 1:2) sdiag[i,i] <- smsvd$d[i]
matu <- msvd$u
matv <- msvd$v
smatu <- smsvd$u
smatv <- smsvd$v
fxfer("addPatt.R")
constantMatrix <- dataMatrixOrdered*0
for(i in 1:dim(dataMatrixOrdered)[1]){constantMatrix[i,] <- rep(c(0,1),each=5)}
svd2 <- svd(constantMatrix)
