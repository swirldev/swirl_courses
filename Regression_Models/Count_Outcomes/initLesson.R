# Put initialization code in this file.
lgData <- read.csv(file.path(find.package("swirl"),
                             "Courses/Regression_Models/Count_Outcomes/leekGroupData.csv"), as.is=TRUE)
lgData[,"date"] <- as.Date(lgData,"date")