
tfc <- read.table(
  file.path(
    find.package("swirl"),
    "Courses",
    "Topics_in_Generalized_Linear_Models",
    "Time_for_a_Change_Election_Model",
    "tfc.csv"
  ), 
  as.is=TRUE, header=TRUE, sep=",")