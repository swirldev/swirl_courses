library(ggplot2)
library(jpeg)
library(lattice)
library(datasets)
data(cars)
data(mpg)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

state <- data.frame(state.x77, region = state.region)
# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
	"Exploratory_Data_Analysis","Plotting_Systems")
plot.new()