n = 50
B = 1000
## our data
d = sample(1 : 6, n, replace = TRUE)
## bootstrap resamples
resamples = matrix(sample(d,
                          n * B,
                          replace = TRUE),
                   B, n)
resampledMeans = apply(resamples, 1, mean)
g1 <- ggplot(as.data.frame(prop.table(table(d))), aes(x = d, y = Freq)) + geom_bar(colour = "black", fill = "lightblue", stat = "identity") 
g2 <- ggplot(data.frame(d = resampledMeans), aes(x = d)) + geom_histogram(binwidth=.2, colour = "black", fill = "salmon", aes(y = ..density..)) 
#grid.arrange(g1, g2, ncol = 2)
print(g1)

