library(ggplot2)
# Put initialization code in this file.
path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Exploratory_Graphs/")
pollution <- read.csv(paste(path_to_course,"avgpm25.csv"), colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
high <- pollution$pm25[pollution$pm25>15]
low <- pollution$pm25[pollution$pm25<5]
plot.new()