swiss <- car::swiss
file.copy(from=file.path(find.package("swirl"),
                         "Courses/Regression_Models",
                         "Overfitting_and_Underfitting/fitting.R"), 
          to="fitting.R")
file.edit("fitting.R")
source("fitting.R")