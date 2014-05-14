# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.

data(InsectSprays); 
sA <- InsectSprays$count[InsectSprays$spray=="A"]
sB <- InsectSprays$count[InsectSprays$spray=="B"]
sC <- InsectSprays$count[InsectSprays$spray=="C"]
sD <- InsectSprays$count[InsectSprays$spray=="D"]
sE <- InsectSprays$count[InsectSprays$spray=="E"]
sF <- InsectSprays$count[InsectSprays$spray=="F"]


boxplot(count ~ spray, data = InsectSprays,
        xlab = "Type of spray", ylab = "Insect count",
        main = "InsectSprays data", varwidth = TRUE, col = "lightgray")


