# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
dice_fair <- c(1/6,1/6,1/6,1/6,1/6,1/6)
dice_high <- c(1/21,2/21,3/21,4/21,5/21,6/21)
dice_low <- c(6/21,5/21,4/21,3/21,2/21,1/21)
expect_dice <- function(pmf){ mu <- 0; for (i in 1:6) mu <- mu + i*pmf[i]; mu}
dice_sqr <- c(1,4,9,16,25,36)
edh <- expect_dice(dice_high)
edl <- expect_dice(dice_low)
nsim <- 1000
samsz <- 10
#get correct paths for plotting
pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
  	"Statistical_Inference","Variance",
                      fileName)
}
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
  fileName
}