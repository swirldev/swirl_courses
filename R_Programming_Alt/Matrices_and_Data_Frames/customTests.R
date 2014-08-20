expr_creates_var <- function(correctName=NULL){
  e <- get("e", parent.frame())
  # TODO: Eventually make auto-detection of new variables an option.
  # Currently it can be set in customTests.R
  delta <- if(!customTests$AUTO_DETECT_NEWVAR){
    safeEval(e$expr, e)
  } else {
    e$delta
  }
  if(is.null(correctName)){
    results <- expectThat(length(delta) >= 1,
                          testthat::is_true(),
                          label=paste(deparse(e$expr), 
                                      "does not create a variable."))  
  } else {
    results <- expectThat(correctName %in% names(delta), 
                          testthat::is_true(), 
                          label=paste(deparse(e$expr),
                                      "does not create a variable named",
                                      correctName))
  }
  if(results$passed){
    e$newVar <- e$val
    e$newVarName <- names(delta)[1]
    e$delta <- mergeLists(delta, e$delta)
  } else {
    e$delta <- list()
  }
  return(results$passed)
}

# Returns TRUE if the user has calculated a value equal to that calculated by the given expression.
calculates_same_value <- function(expr){
  e <- get("e", parent.frame())
  # Calculate what the user should have done.
  eSnap <- cleanEnv(e$snapshot)
  val <- eval(parse(text=expr), eSnap)
  passed <- isTRUE(all.equal(val, e$val))
  if(!passed)e$delta <- list()
  return(passed)
}

omnitest <- function(correctExpr=NULL, correctVal=NULL, strict=FALSE){
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correctExpr) && is.null(correctVal))return(TRUE)
  # Testing for correct expression only
  if(!is.null(correctExpr) && is.null(correctVal)){
    passed <- expr_identical_to(correctExpr)
    if(!passed)e$delta <- list()
    return(passed)
  }
  # Testing for both correct expression and correct value
  # Value must be character or single number
  valGood <- NULL
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
  exprGood <- ifelse(is.null(correctExpr), TRUE, expr_identical_to(correctExpr))
  if(valGood && exprGood){
    return(TRUE)
  } else if (valGood && !exprGood && !strict){
    swirl_out("That's not the expression I expected but it works.")
    swirl_out("I've executed the correct expression in case the result is needed in an upcoming question.")
    eval(parse(text=correctExpr),globalenv())
    return(TRUE)
  } else {
    e$delta <- list()
    return(FALSE)
  }
}

notify <- function() {
  e <- get("e", parent.frame())
  if(e$val == "No") return(TRUE)
  
  good <- FALSE
  while(!good) {
    # Get info
    name <- readline_clean("What is your full name? ")
    address <- readline_clean("What is the email address of the person you'd like to notify? ")
    
    # Repeat back to them
    message("\nDoes everything look good?\n")
    message("Your name: ", name, "\n", "Send to: ", address)
    
    yn <- select.list(c("Yes", "No"), graphics = FALSE)
    if(yn == "Yes") good <- TRUE
  }
  
  # Get course and lesson names
  course_name <- attr(e$les, "course_name")
  lesson_name <- attr(e$les, "lesson_name")
  
  subject <- paste(name, "just completed", course_name, "-", lesson_name)
  body = ""
  
  # Send email
  swirl:::email(address, subject, body)
  
  hrule()
  message("I just tried to create a new email with the following info:\n")
  message("To: ", address)
  message("Subject: ", subject)
  message("Body: <empty>")
  
  message("\nIf it didn't work, you can send the same email manually.")
  hrule()
  
  # Return TRUE to satisfy swirl and return to course menu
  TRUE
}

readline_clean <- function(prompt = "") {
  wrapped <- strwrap(prompt, width = getOption("width") - 2)
  mes <- stringr::str_c("| ", wrapped, collapse = "\n")
  message(mes)
  readline()
}

hrule <- function() {
  message("\n", paste0(rep("#", getOption("width") - 2), collapse = ""), "\n")
}

