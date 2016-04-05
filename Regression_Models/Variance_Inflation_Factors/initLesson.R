# Put initialization code in this file.
 file.copy(from=file.path(swirl:::swirl_courses_dir(),
 	"Regression_Models", "Variance_Inflation_Factors","vifSims.R"), 
                          to="vifSims.R")
 data(swiss)
 file.edit("vifSims.R")
 source("vifSims.R", local=TRUE)
 