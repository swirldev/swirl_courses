# Put initialization code in this file.
hits <- read.csv(file.path(swirl:::swirl_courses_dir(), "Regression_Models",
	"Count_Outcomes", "leekGroupData.csv"), as.is=TRUE)
hits[,"date"] <- as.Date(hits[,"date"])