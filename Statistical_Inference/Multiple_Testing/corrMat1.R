fname <- pathtofile("corrected1.jpeg")
plot.new()
plotArea=par('fig')
rasterImage(readJPEG(fname),plotArea[1],plotArea[3],plotArea[2],plotArea[4])
