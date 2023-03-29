# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

rm(list=ls())
.datapath <- file.path(path.package('swirl'), 'Courses',
                       'Network_analysis_and_Visualization_in_R', 'Lesson_4')
# Read in data

library(igraph)
#setwd("~/Network_Analysis_and_Visualization_in_R/Lesson_4")

preebola=read.csv(paste0(.datapath,"/Pre-Ebola.csv"), header=TRUE, sep=",", stringsAsFactors=FALSE)
ebola=read.csv(paste0(.datapath,"/Ebola.csv"), header=TRUE, sep=",", stringsAsFactors=FALSE)
postebola=read.csv(paste0(.datapath,"/Post Ebola.csv"), header=TRUE, sep=",", stringsAsFactors=FALSE)

g1=graph.data.frame(preebola[,2:3], directed=FALSE)
E(g1)$weight=preebola[,4];
g1=simplify(g1, edge.attr.comb=list("mean"))

g2=graph.data.frame(ebola[,2:3], directed=FALSE)
E(g2)$weight=ebola[,4];
g2=simplify(g2, edge.attr.comb=list("mean"))

g3=graph.data.frame(postebola[,2:3], directed=FALSE)
E(g3)$weight=postebola[,4];
g3=simplify(g3, edge.attr.comb=list("mean"))