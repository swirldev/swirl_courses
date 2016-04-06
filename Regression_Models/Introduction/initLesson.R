# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
galton <- read.csv(file.path(.get_course_path(), 
	"Regression_Models", "Introduction", "galton.csv"))