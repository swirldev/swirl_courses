library(datasets)
data(cars)
data(mpg)
state <- data.frame(state.x77, region = state.region)
# Put initialization code in this file.

path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Exploratory_Graphs")
pollution <- read.csv(paste(path_to_course,"avgpm25.csv",sep="/"), colClasses = c("numeric", "character", "factor", "numeric", "numeric"))

ppm <- pollution$pm25
plot.new()

