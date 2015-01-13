file.copy(from=file.path(find.package("swirl"),
                         "Courses/Exploratory_Data_Analysis",
                         "Dimension_Reduction/addPatt.R"), 
          to="addPatt.R")
# file.edit("cards.R")
source("addPatt.R", local=TRUE)
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
