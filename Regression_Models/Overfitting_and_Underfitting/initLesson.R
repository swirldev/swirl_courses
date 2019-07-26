swiss <- datasets::swiss
file.copy(from=file.path(find.package("swirl"),
                         "Courses/Regression_Models",
                         "Overfitting_and_Underfitting/fitting.R"), 
          to="fitting.R")
file.edit("fitting.R")
source("fitting.R", local=TRUE)
fit5 <- lm(Fertility ~ Agriculture + Examination + Education + Catholic, swiss)
fit6 <- lm(Fertility ~ ., swiss)
