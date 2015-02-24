# Put initialization code in this file.
path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Exploratory_Graphs")
pollution <- read.csv(paste(path_to_course,"avgpm25.csv",sep="/"), colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
high <- pollution$pm25[pollution$pm25>15]
low <- pollution$pm25[pollution$pm25<5]
ppm <- pollution$pm25
plot.new()
par(mfrow=c(1,1))
