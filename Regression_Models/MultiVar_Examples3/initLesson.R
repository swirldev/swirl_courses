# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.

file.copy(from=file.path(find.package("swirl"),
                         "Courses/Regression_Models/MultiVar_Examples3/hunger.csv"),
          to="hunger.csv")
hunger <-read.csv(paste(getwd(),"hunger.csv",sep="/"))
