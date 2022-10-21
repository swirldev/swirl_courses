  assign("cars", openintro::cars93, envir=globalenv())
  assign("mpg.midsize", cars[cars$type=="midsize","mpgCity"], envir=globalenv())
