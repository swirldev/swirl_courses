# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

galton <- read.csv(file.path(.get_course_path(),
	"Regression_Models","Introduction", "galton.csv"))
est <- function(slope, intercept)intercept + slope*galton$parent
sqe <- function(slope, intercept)sum( (est(slope, intercept)-galton$child)^2)
attenu <- datasets::attenu
fname <- paste(.get_course_path(),
	"Regression_Models","Residuals","res_eqn.R",sep="/")
