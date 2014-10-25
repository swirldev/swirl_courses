resamples <- matrix(sample(sh,
                           nh * B,
                           replace = TRUE),
                    B, nh)
resampledMedians <- apply(resamples, 1, median)
g = ggplot(data.frame(x = resampledMedians), aes(x = x)) 
g = g + geom_density(size = 2, fill = "red")
#g = g + geom_histogram(alpha = .20, binwidth=.3, colour = "black", fill = "blue", aes(y = ..density..)) 
g = g + geom_vline(xintercept = median(sh), size = 2)
print(g)

