# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
hits <- read.csv(file.path(.get_course_path(), "Regression_Models",
	"Count_Outcomes", "leekGroupData.csv"), as.is=TRUE)
hits[,"date"] <- as.Date(hits[,"date"])