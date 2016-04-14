# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.

file.copy(from=file.path(file.path(.get_course_path(),
	"Regression_Models","MultiVar_Examples3","hunger.csv")),
          to="hunger.csv")
                         
hunger <-read.csv(file.path(.get_course_path(),
	"Regression_Models","MultiVar_Examples3","hunger.csv"))
