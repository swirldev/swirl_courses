g = ggplot(InsectSprays, aes(spray, count, fill = spray))
g = g + geom_boxplot()
print(g)
subdata <- InsectSprays[InsectSprays$spray %in% c("B", "C"),]
Bdata <- subdata[subdata$spray=="B",]
Cdata <- subdata[subdata$spray=="C",]
group <- as.character(subdata$spray)
testStat <- function(w, g) mean(w[g == "B"]) - mean(w[g == "C"])
BCcounts <- subdata$count
obs <- testStat(BCcounts, group)


