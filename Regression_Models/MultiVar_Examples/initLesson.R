# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.

data(swiss); 
pairs(swiss, panel = panel.smooth, main = "Swiss data", col = 3 + (swiss$Catholic > 50))

# Put initialization code in this file.
file.copy(from=file.path(.get_course_path(),
	"Regression_Models", "MultiVar_Examples", "swissLMs.R"), 
          to="swissLMs.R")
file.edit("swissLMs.R")
source("swissLMs.R", local=TRUE)
