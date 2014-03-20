
courseraCheck <- function(){
  require(stringr)
  require(digest)
  require(RCurl)
  e <- get("e", parent.frame())  
  modtype <- attr(e$les, "type")
  course_name <- gsub(" ", "_", attr(e$les, "course_name"))
  lesson_name <- gsub(" ", "_", attr(e$les, "lesson_name"))
  # The user is questioned about submission at the last line of
  # the lesson itself. The choice is stored in e$val.
  choice <- e$val
  if(choice=="No")return(TRUE)
  # Get submission credentials
  r <- getCreds(e)
  email <- r["email"]
  output <- substr(e$coursera, 1, 16)
  passwd <- r["passwd"]
  if(choice=="Yes"){
    swirl_out("I'll try to tell Coursera you've completed this lesson now.")
    challenge.url <- paste("http://class.coursera.org", course_name,
                           "assignment/challenge", sep = "/")
    submit.url <- paste("http://class.coursera.org", course_name,
                        "assignment/submit", sep = "/")
    ch <- try(getChallenge(email, challenge.url), silent=TRUE)
    # Continue only if the challenge has worked
    if(!is(ch, "try-error")){
      ch.resp <- challengeResponse(passwd, ch$ch.key)
      # If submit.url is invalid, submitSolution should return a try-error.
      # However, that is not the only way it can fail; see below.
      results <- submitSolution(email, submit.url, ch.resp, 
                                sid=lesson_name, output=output,
                                signature=ch$state)
      if(!is(results, "try-error")){
        # TODO: It would be best to detect success here, rather than
        # failure, but as of Feb 23 2014, submit.url may not throw
        # an error indicating failure but instead return an HTML
        # notification beginning with the word, "Exception".
        # Here we detect failure by the presence of this word.
        # Server-side behavior could easily change and could easily
        # be course dependent, so some standard handshake will have
        # to be set up eventually.
        swirl_out(results)
        if(!str_detect(results, "[Ee]xception")){
          swirl_out(paste0("I've notified Coursera that you have completed ",
                           course_name, ", ", lesson_name,"."))
          return()
        }
        swirl_out("I'm sorry, something went wrong with automatic submission.")
      } else {
        swirl_out("I'm sorry, something went wrong with automatic submission.")
      }
    } else {
      swirl_out("I'm sorry, something went wrong with establishing connection.")
    }
  }#yes branch
  writeLines(output, paste0(course_name,"_",lesson_name,".txt"))
  swirl_out("To notify Coursera that you have completed this lesson, please upload ")
  swirl_out(paste0(course_name,"_",lesson_name,".txt "))
  swirl_out(" to Coursera manually.")
  readline("...")
  return(TRUE)
}

getCreds <- function(e) {
  credfile <- file.path(e$udat, paste0(e$les$course_name,".txt"))
  e$coursera <- digest(paste0("complete", paste0(
    rep("_", ifelse(is.null(e$skips), 0, e$skips)), collapse="")),
    algo="sha1", serialize = FALSE)
  if(!file.exists(credfile)){
    email <- readline("Submission login (email): ")
    passwd <- readline("Submission  password: ")
    writeLines(c(email, passwd), credfile)
    return(c(email = email, passwd = passwd))
  } else {
    r <- readLines(credfile)
    names(r) <- c("email", "passwd")
    return(r)
  }
}

getChallenge <- function(email, challenge.url) {
  params <- list(email_address = email, response_encoding = "delim")
  result <- getForm(challenge.url, .params = params)
  s <- strsplit(result, "|", fixed = TRUE)[[1]]
  list(ch.key = s[5], state = s[7])
}

challengeResponse <- function(password, ch.key) {
  x <- paste(ch.key, password, sep = "")
  digest(x, algo = "sha1", serialize = FALSE)
}

submitSolution <- function(email, submit.url, ch.resp, sid, output, 
                           signature, src = "",http.version = NULL) {
  output <- as.character(base64(output))
  src <- as.character(base64(src))
  params <- list(assignment_part_sid = sid,
                 email_address = email,
                 submission = output,
                 submission_aux = src,
                 challenge_response = ch.resp,
                 state = signature)
  params <- lapply(params, URLencode)
  result <- try(postForm(submit.url, .params = params), silent=TRUE)
  if(is(result,"try-error")){
    return(result)
  } else {
    s <- strsplit(result, "\\r\\n")[[1]]
    return(tail(s, 1))
  }
}

omnitest <- function(correctExpr=expr, correctVal=val){
  e <- get("e", parent.frame())
  swirl_out(paste("Demonstrating omnitest override. You answered", e$val))
  return(TRUE)
}