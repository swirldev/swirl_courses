
tfc <- read.table(
  file.path(
    dirname(sys.frame(1)$ofile),
    "tfc.csv"
  ), 
  as.is=TRUE, header=TRUE, sep=",")