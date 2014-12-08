local({
  d <- file.path("Topics_in_Generalized_Linear_Models", "Time_for_a_Change_Election_Model")
  d <- file.path(find.package("swirl"), "Courses", d)
  img <- readJPEG(file.path(d, "Bryan.jpg"))
  h <- dim(img)[1]
  w <- dim(img)[2]
  try(dev.off(),silent=TRUE)
  plot.new()
  wdev <- par('fin')[1]
  hdev <- par('fin')[2]
  rasterImage(
    as.raster(img),
    par('fig')[1], par('fig')[3], par('fig')[2]*hdev*h/w/wdev*1.3, par('fig')[4],
    interpolate=FALSE
  )
})
