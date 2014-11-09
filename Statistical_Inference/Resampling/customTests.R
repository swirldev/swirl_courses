# So swirl does not repeat execution of plot commands
AUTO_DETECT_NEWVAR <- FALSE

obliterate <- function(vName){
  e <- get("e", parent.frame())
#   print(paste("Hello from obliterate",vName,sep=" "))
#   if(exists(vName,envir=globalenv()))print(paste(vName," exists"))
#   else print(paste(vName," doesn't exist"))
  try(rm(list=c(vName),envir=globalenv()),silent=TRUE)
#   if(exists(vName,envir=globalenv()))print(paste(vName," exists"))
#   else print(paste(vName," doesn't exist"))
  idx <- which(names(e$snapshot)==vName)
#   print(paste("Hello from obliterate idx of ",vName," is ",idx,sep=" "))
  try(e$snapshot <- e$snapshot[-idx],silent=TRUE)
}

# Returns TRUE if e$expr matches any of the expressions given
# (as characters) in the argument.
ANY_of_exprs <- function(...){
  e <- get("e", parent.frame())
  any(sapply(c(...), function(expr)omnitest(expr)))
}

equiv_val <- function(correctVal){
  e <- get("e", parent.frame()) 
  #print(paste("User val is ",e$val,"Correct ans is ",correctVal))
  isTRUE(all.equal(correctVal,e$val))
  
}

