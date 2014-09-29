# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.
file.copy(from=file.path(find.package("swirl"),
                         "Courses/Statistical_Inference",
                         "Probability1/cards.R"), 
          to="cards.R")
# file.edit("cards.R")
source("cards.R", local=TRUE)
