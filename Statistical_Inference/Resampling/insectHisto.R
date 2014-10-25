g = ggplot(data.frame(perms = perms),
           aes(perms))
g = g + geom_histogram(fill = "lightblue", color = "black", binwidth = 1)
g = g + geom_vline(xintercept = obs, size = 2)
print(g)