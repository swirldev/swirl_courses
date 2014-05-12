local({
  fname <- file.path(find.package("swirl"), 
                     "Courses/Regression_Models/Introduction_to_Multivariable_Regression/elimination.R")
  file.copy(fname, "elimination.R")
  file.edit("elimination.R")
})
source("elimination.R")
galton <- UsingR::galton
trees <- datasets::trees
trees <- cbind(Constant=rep(1.0, nrow(trees)), trees)
