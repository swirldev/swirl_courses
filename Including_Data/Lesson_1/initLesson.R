# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.

# Make path to lesson directory for convenience. Unfortunately 
# this variable will show up in the user's workspace. Alternatively,
# you could retype this file path every time you need it below.
lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Including_Data", "Lesson_1")

### To make the data available, you have two options:

### 1) Make path to data and let user call read.csv(data_path)
data_path <- file.path(lesson_dir, "airquality.csv")

### 2) Load data into a variable for the user
air <- read.csv(data_path, stringsAsFactors=FALSE)


### You won't need any of the following code ###

# Function to display initLesson.R
see_init <- function() {
  # Create path to initLesson.R
  init_path <- file.path(lesson_dir, "initLesson.R")
  # Open it
  file.edit(init_path)
}