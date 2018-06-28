# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.
rm(list=ls())
library(igraph)

gE=erdos.renyi.game(50, p=.05)
gB1=barabasi.game(50, power=1, directed=FALSE)
gB2=barabasi.game(50, power=2, directed=FALSE)
