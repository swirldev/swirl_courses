# ravens data
ravenData <- read.csv(file.path(swirl:::swirl_courses_dir(), 
                                 "Regression_Models", "Binary_Outcomes", "ravens_data.csv"))
ravenData <- ravenData[order(ravenData$ravenScore), 1:3]
rownames(ravenData) <- NULL
