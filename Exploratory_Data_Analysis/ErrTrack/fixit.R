fixInformals <- function(expr,fct){

  fmls <- formals(fct)
  mylist <- character()
  myfmls <- character()
  mynum <- numeric()
  for(n in names(expr[-1])){
     if(!(n %in% names(fmls))){
        mylist <- c(mylist,n)
     }
  }

  myfmls <- setdiff(names(expr[-1]),mylist)
  mylist <- sort(mylist)
  myfmls <- c(myfmls,mylist)

  for (n  in 1:length(myfmls)){ 
    mynum <- c(mynum,which(names(expr[-1])==myfmls[n]))
  }
 mynum <- c(1,mynum+1)
 expr <- expr[mynum]
  
}