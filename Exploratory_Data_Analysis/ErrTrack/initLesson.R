library(ggplot2)
library(jpeg)
library(lattice)
library(datasets)
data(cars)
data(mpg)
state <- data.frame(state.x77, region = state.region)
# Put initialization code in this file.

path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Exploratory_Graphs")
pollution <- read.csv(paste(path_to_course,"avgpm25.csv",sep="/"), colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
high <- pollution$pm25[pollution$pm25>15]
low <- pollution$pm25[pollution$pm25<5]
ppm <- pollution$pm25
plot.new()

path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Plotting_Systems")
plot.new()
