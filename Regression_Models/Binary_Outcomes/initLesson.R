# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# ravens data
ravenData <- read.csv(file.path(.get_course_path(), 
                                 "Regression_Models", "Binary_Outcomes", "ravens_data.csv"))
ravenData <- ravenData[order(ravenData$ravenScore), 1:3]
rownames(ravenData) <- NULL
