# Put initialization code in this file.
pathtofile <- function(fileName){
  mypath <- file.path(swirl:::swirl_courses_dir(),
  	"Statistical_Inference","Multiple_Testing",
                    fileName)
}
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
}