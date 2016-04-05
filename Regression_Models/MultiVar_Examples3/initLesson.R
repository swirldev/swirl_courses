# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.

file.copy(from=file.path(file.path(swirl:::swirl_courses_dir(),
	"Regression_Models","MultiVar_Examples3","hunger.csv"),
          to="hunger.csv")
                         
hunger <-read.csv(file.path(swirl:::swirl_courses_dir(),
	"Regression_Models","MultiVar_Examples3","hunger.csv"))
