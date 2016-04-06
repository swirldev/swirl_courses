# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
	"Exploratory_Data_Analysis","Exploratory_Graphs")
pollution <- read.csv(paste(path_to_course,"avgpm25.csv",sep="/"), colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
high <- pollution$pm25[pollution$pm25>15]
low <- pollution$pm25[pollution$pm25<5]
ppm <- pollution$pm25
plot.new()
par(mfrow=c(1,1))
