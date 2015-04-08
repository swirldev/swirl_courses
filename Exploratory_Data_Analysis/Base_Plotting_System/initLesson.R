library(jpeg)
library(datasets)
data(cars)
data(mpg)
state <- data.frame(state.x77, region = state.region)
# Put initialization code in this file.
path_to_course <- file.path(find.package("swirl"),"Courses/Exploratory_Data_Analysis/Base_Plotting_System")
try(dev.off(), silent=TRUE)
plot.new()
