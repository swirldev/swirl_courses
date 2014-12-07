try(dev.off(),silent=TRUE)
plot.new()
rasterImage(
  as.raster(readJPEG(file.path(dirname(sys.frame(1)$ofile), "tfc.jpg"))),
  par('fig')[1], par('fig')[3], par('fig')[2], par('fig')[4],
  interpolate=FALSE
)
try(dev.off(),silent=TRUE)
