# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

rm(list=ls())

library(igraph)

caveman<-function(nodes, caves, npc, ebc){
  #nodes - total nodes in network
  #caves - total caves
  #npc - nodes per cave
  #ebc - edges between caves
  require(igraph)
  g=graph.empty(0, directed=FALSE);
  for(i in 1:caves){
    g=add.vertices(g, npc, attr=list("mycave" = i))
    relnodes <- V(g)[mycave == i]
    g[relnodes, relnodes] <- 1
    g <- simplify(g)
    
  }
  #Add edges between caves
  for(i in 1:(caves-1)){
    n1s=sample((npc*(i-1)+1):(npc*i), ebc)
    n2s=sample((npc*(i)+1):(npc*(i+1)), ebc)
    g[n1s,n2s]=1;
    g=simplify(g);
  }
  n1s=sample(1:npc, ebc)
  n2s=sample((npc*(i)+1):(npc*(i+1)), ebc)
  g[n1s,n2s]=1;
  g=simplify(g);
  
  return(g)
  
}

gcave1=caveman(100, 5, 20, 3)
gcave2=caveman(100, 10, 10, 2)
gcave3=caveman(100, 20, 5, 1)
karate=graph.famous("Zachary")
realsplitk=spinglass.community(karate, spins=2)