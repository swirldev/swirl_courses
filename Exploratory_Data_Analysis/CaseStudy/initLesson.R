library(fields)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
  "Exploratory_Data_Analysis","CaseStudy")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
    "Exploratory_Data_Analysis","CaseStudy",
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
#my1999 <- pathtofile("RD_501_88101_1999-0.txt.gz")
my1999 <- pathtofile("airData1999.txt.gz")
#my2012 <- pathtofile("RD_501_88101_2012-0.txt.gz")
my2012 <- pathtofile("airData2012.txt.gz")
cnames <- "# RD|Action Code|State Code|County Code|Site ID|Parameter|POC|Sample Duration|Unit|Method|Date|Start Time|Sample Value|Null Data Code|Sampling Frequency|Monitor Protocol (MP) ID|Qualifier - 1|Qualifier - 2|Qualifier - 3|Qualifier - 4|Qualifier - 5|Qualifier - 6|Qualifier - 7|Qualifier - 8|Qualifier - 9|Qualifier - 10|Alternate Method Detectable Limit|Uncertainty"
pm0 <- read.table(my1999, comment.char = "#", header = FALSE, sep = "|", na.strings = "")
pm1 <- read.table(my2012, comment.char = "#", header = FALSE, sep = "|", na.strings = "")
wcol <- c(3,4,5,11,13)
#pm0 <- pm0[,wcol]
#pm1 <- pm1[,wcol]
