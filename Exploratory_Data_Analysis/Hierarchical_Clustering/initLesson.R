library(fields)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
	"Exploratory_Data_Analysis","Hierarchical_Clustering")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
  	"Exploratory_Data_Analysis","Hierarchical_Clustering/",
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
set.seed(1234);
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
dataFrame <- data.frame(x=x,y=y)
dataMatrix <- as.matrix(dataFrame)
distxy <- dist(dataFrame)
xsm <- c(x[4],x[8],x[11])
ysm <- c(y[4],y[8],y[11])
dFsm <- data.frame(x=xsm,y=ysm)
mt <- as.matrix(mtcars)
mt <- mt[22:32,1:6]
distmt <- dist(mt)
denmt <- as.dendrogram(hclust(distmt))
