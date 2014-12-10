# So swirl does not repeat execution of plot commands
AUTO_DETECT_NEWVAR <- FALSE

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

omnitest <- function(correctExpr=NULL, correctVal=NULL, strict=FALSE, eval_for_class=as.logical(NA)){
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correctExpr) && is.null(correctVal))return(TRUE)
  # If eval_for_class is not specified, default to customTests$EVAL_FOR_CLASS.
  # If the latter is not set, default to TRUE.
  if(is.na(eval_for_class)){
    if(exists("EVAL_FOR_CLASS", customTests)){
      eval_for_class <- isTRUE(customTests$EVAL_FOR_CLASS)
    } else {
      eval_for_class <- TRUE
    }
  }
  # If eval_for_class is TRUE, create a parent environment for that in
  # in which evaluations for class are to be made.
  eval_env <- if(eval_for_class){
    cleanEnv(e$snapshot)
  } else {
    NULL
  }
  # Testing for correct expression only
  if(!is.null(correctExpr) && is.null(correctVal)){
    err <- try({
      good_expr <- parse(text=correctExpr)[[1]]
      ans <- is_robust_match(good_expr, e$expr, eval_for_class, eval_env)
    }, silent=TRUE)
    if (is(err, "try-error")) {
      return(expr_identical_to(correctExpr))
    } else {
      return(ans)
    }
  }
  # Testing for both correct expression and correct value
  # Value must be character or single number
  valGood <- as.logical(NA)
  if(!is.null(correctVal)){
    if(is.character(e$val)){
      valResults <- expectThat(e$val,
                               is_equivalent_to(correctVal, label=correctVal),
                               label=(e$val))
      if(is(e, "dev") && !valResults$passed)swirl_out(valResults$message)
      valGood <- valResults$passed
      # valGood <- val_matches(correctVal)
    } else if(!is.na(e$val) && is.numeric(e$val) && length(e$val) == 1){
      cval <- try(as.numeric(correctVal), silent=TRUE)
      valResults <- expectThat(e$val, 
                               equals(cval, label=correctVal),
                               label=toString(e$val))
      if(is(e, "dev") && !valResults$passed)swirl_out(valResults$message)
      valGood <- valResults$passed
    }
  }
  # If a correct expression is given attempt a robust match with user's expression.
  exprGood <- TRUE
  if(!is.null(correctExpr)){
    err <- try({
      good_expr <- parse(text=correctExpr)[[1]]
      ans <- is_robust_match(good_expr, e$expr, eval_for_class, eval_env)
    }, silent=TRUE)
    exprGood <- ifelse(is(err, "try-error"), expr_identical_to(correctExpr), ans)
  }
  if((isTRUE(valGood) || is.na(valGood)) && exprGood){
    return(TRUE)
  } else if (isTRUE(valGood) && !exprGood && !strict){
    swirl_out("That's not the expression I expected but it works.")
    swirl_out("I've executed the correct expression in case the result is needed in an upcoming question.")
    eval(parse(text=correctExpr),globalenv())
    return(TRUE)
  } else {
    return(FALSE)
  }
}

is_robust_match <- function(expr1, expr2, eval_for_class, eval_env=NULL){
  expr1 <- rmatch_calls(expr1, eval_for_class, eval_env)
  expr2 <- rmatch_calls(expr2, eval_for_class, eval_env)
#   print(paste("expr1 is ",deparse(expr1)))
#   print(paste("expr2 is ",deparse(expr2)))
  isTRUE(all.equal(expr1, expr2))
}

rmatch_calls <- function(expr, eval_for_class=FALSE, eval_env=NULL){
  # If expr is not a call, just return it.
  if(!is.call(expr))return(expr)
  # Replace expr's components with matched versions.
  for(n in 1:length(expr)){
    expr[[n]] <- rmatch_calls(expr[[n]],eval_for_class)
  }
  # If match.fun(expr[[1]]) raises an exception here, the code which follows
  # would be likely to give a misleading result. Catch the error merely to
  # produce a better diagnostic.
  tryCatch(fct <- match.fun(expr[[1]]),
           error=function(e)stop(paste0("Illegal expression ", dprs(expr), 
                                        ": ", dprs(expr[[1]]), " is not a function.\n")))
  # If fct is a special function such as `$`, or builtin such as `+`, return expr.
  if(is.primitive(fct)){
    return(expr)
  }
  # If fct is an (S4) standardGeneric, match.call is likely to give a misleading result,
  # so raise an exception. (Note that builtins were handled earlier.)
  if(is(fct, "standardGeneric")){
    stop(paste0("Illegal expression, ", dprs(expr), ": ", dprs(expr[[1]]), " is a standardGeneric.\n"))
  }
  # At this point, fct should be an ordinary function or an S3 method.
  if(isS3(fct)){
    # If the S3 method's first argument, expr[[2]], is anything but atomic 
    # its class can't be determined here without evaluation.
    if(!is.atomic(expr[[2]]) & !eval_for_class){
      stop(paste0("Illegal expression, ", dprs(expr),": The first argument, ", dprs(expr[[2]]), 
                  ", to S3 method '", dprs(expr[[1]]), 
                  "', is a ", class(expr[[2]]) , ", which (as an expression) is not atomic,",
                  " hence its class can't be determined in an abstract",
                  " syntax tree without additional information.\n"))
    }
    # Otherwise, attempt to find the appropriate method.
    if(is.null(eval_env)){
      eval_env <- new.env()
    } else {
      eval_env <- new.env(parent=eval_env)
    }
    temp <- eval(expr[[2]], envir = eval_env)
    classes <- try(class(temp), silent=TRUE)
    for(cls in classes){
      err <- try(fct <- getS3method(as.character(expr[[1]]), cls), silent=TRUE)
      if(!is(err, "try-error"))break
    }
    # If there was no matching method, attempt to find the default method. If that fails,
    # raise an error
    if(is(err, "try-error")){
      tryCatch(fct <- getS3method(as.character(expr[[1]]), "default"),
               error = function(e)stop(paste0("Illegal expression ", dprs(expr), ": ",
                                              "There is no matching S3 method or default for object, ",
                                              dprs(expr[[2]]), ", of class, ", cls,".\n")))
    }
  }
  
  expr <- enhancedMatch(fct,expr)
#   # Form preliminary match. If match.call raises an error here, the remaining code is
#   # likely to give a misleading result. Catch the error merely to give a better diagnostic.
#   tryCatch(expr <- match.call(fct, expr),
#            error = function(e)stop(paste0("Illegal expression ", dprs(expr), ": ", 
#                                           dprs(expr[[1]]), " is not a function.\n")))
#   expr <- fixInformals(fct,expr)
#   # Append named formals with default values which are not included
#   # in the preliminary match
#   fmls <- formals(fct)
#   for(n in names(fmls)){
#     if(!isTRUE(fmls[[n]] == quote(expr=)) && !(n %in% names(expr[-1]))){
#       expr[n] <- fmls[n]
#     }
#   }
#   # match call again, for order
#   expr <- match.call(fct, expr)
  return(expr)
}

isS3 <- function(fct)isTRUE(grep("UseMethod", body(fct)) > 0)
dprs <- function(expr)deparse(expr, width.cutoff=500)

enhancedMatch <- function(fct,expr){
  #   # Form preliminary match. If match.call raises an error here, the remaining code is
  #   # likely to give a misleading result. Catch the error merely to give a better diagnostic.
  tryCatch(expr <- match.call(fct, expr),
           error = function(e)stop(paste0("Illegal expression ", dprs(expr), ": ", 
                                         dprs(expr[[1]]), " is not a function.\n")))  #define three lists, informals, formals, indices
  mylist <- character()
  myfmls <- character()
  mynum <- numeric()
  # find formal parameters of fct
  fmls <- formals(fct)
  # form list of nonformal parameter names
  for(n in names(expr[-1])){
    if(!(n %in% names(fmls))){
      mylist <- c(mylist,n)
    }
  }
  # myfmls is list of formal params only
  myfmls <- setdiff(names(expr[-1]),mylist)
  # append sorted nonformals to list of formals
  myfmls <- c(myfmls,sort(mylist))
  # now create list of indices in correct order
  for (n  in 1:length(myfmls)){ 
    mynum <- c(mynum,1+which(names(expr[-1])==myfmls[n]))
  }
  mynum <- c(1,mynum)
  # permute expr
  expr <- expr[mynum]
  # Append named formals with default values which are not included
  # in the preliminary match
  for(n in names(fmls)){
      if(!isTRUE(fmls[[n]] == quote(expr=)) && !(n %in% names(expr[-1]))){
        expr[n] <- fmls[n]
      }
   }
  # match call again, for order
  expr <- match.call(fct, expr)
  return(expr)
}
