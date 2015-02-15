find_course <- function(course){
  file.path(find.package("swirl"), "Courses", gsub(" ", "_", course))
}

# attempt to display a swirl file
display_swirl_file <- function(filename, course, lesson=""){
  fname <- filename
  if(lesson != "")fname <- file.path(lesson, filename)
  loc <- gsub(" ", "_", file.path( find_course(course),  fname))
  toloc <- file.path("swirl_temp", filename)
  if(!file.exists("swirl_temp"))dir.create("swirl_temp")
  file.copy(loc, "swirl_temp", overwrite=TRUE)
  if(isTRUE(1 == grep("*[.]R$", filename))){
    file.edit(toloc, title=filename)
  } else {
    file.show(toloc, title=filename)
  }
  message(paste("(Copied file", filename, "to", file.path(getwd(), toloc), ")."))
}
