library(jpeg)
library(datasets)
data(cars)
data(mpg)
state <- data.frame(state.x77, region = state.region)
# Put initialization code in this file.
path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Graphics_Devices_in_R")
dev.off()
plot.new()
