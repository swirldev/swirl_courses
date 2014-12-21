str(maacs)
eno <- read.csv("eno.csv")
skin <- read.csv("skin.csv")
env <- read.csv("environmental.csv")
m <- merge(eno, env, by = "id")
maacs <- merge(m, skin, by = "id")

#Histogram of eNO

qplot(log(eno), data = maacs)

#Histogram by Group

qplot(log(eno), data = maacs, fill = mopos)

#Density Smooth

qplot(log(eno), data = maacs, geom = "density")
qplot(log(eno), data = maacs, geom = "density", color = mopos)

#Scatterplots: eNO vs. PM$_{2.5}$
  
qplot(log(pm25), log(eno), data = maacs)
qplot(log(pm25), log(eno), data = maacs, shape = mopos)
qplot(log(pm25), log(eno), data = maacs, color = mopos)

qplot(log(pm25), log(eno), data = maacs, color = mopos, 
        geom = c("point", "smooth"), method = "lm")

qplot(log(pm25), log(eno), data = maacs, geom = c("point", "smooth"), 
        method = "lm", facets = . ~ mopos)
