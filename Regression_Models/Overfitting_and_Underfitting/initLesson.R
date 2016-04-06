# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

swiss <- datasets::swiss
file.copy(from=file.path(.get_course_path(),
	"Regression_Models", "Overfitting_and_Underfitting","fitting.R"), 
          to="fitting.R")
file.edit("fitting.R")
source("fitting.R", local=TRUE)
fit5 <- lm(Fertility ~ Agriculture + Examination + Education + Catholic, swiss)
fit6 <- lm(Fertility ~ ., swiss)
