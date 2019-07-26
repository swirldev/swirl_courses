# Put initialization code in this file.
 file.copy(from=file.path(find.package("swirl"),
                          "Courses/Regression_Models",
                          "Variance_Inflation_Factors/vifSims.R"), 
                          to="vifSims.R")
 data(swiss)
 file.edit("vifSims.R")
 source("vifSims.R", local=TRUE)
 