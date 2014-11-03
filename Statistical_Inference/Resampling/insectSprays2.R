g = ggplot(InsectSprays, aes(spray, count, fill = spray))
g = g + geom_boxplot()
print(g)
subdata <- InsectSprays[InsectSprays$spray %in% c("D", "E"),]
Ddata <- subdata[subdata$spray=="D",]
Edata <- subdata[subdata$spray=="E",]
group <- as.character(subdata$spray)
testStat <- function(w, g) mean(w[g == "D"]) - mean(w[g == "E"])
DEcounts <- subdata$count
obs <- testStat(DEcounts, group)


