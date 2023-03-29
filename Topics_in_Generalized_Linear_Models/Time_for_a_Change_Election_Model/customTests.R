AUTO_DETECT_NEWVAR <- FALSE

# Returns TRUE if the user has created a specified lm model
# with a specified name.
creates_lm_model <- function(correctExpr){
  e <- get("e", parent.frame())
  # Do what the user should have done
  eSw <- cleanEnv(e$snapshot)
  mdlSw <- eval(parse(text=correctExpr), eSw)
  # Recreate what the user has done
  eUsr <- cleanEnv(e$snapshot)
  mdlUsr <- eval(e$expr, eUsr)
  # If the correct model is named:
  if(length(ls(eSw))>0){
    # Check whether the model's name is correct
    nameGood <- sum(ls(eUsr) %in% ls(eSw)) & sum(ls(eSw) %in% ls(eUsr))
    # If not, highlight the misspelling
    if(!nameGood){
      swirl_out(paste0("You seem to have misspelled the model's name. I was expecting ", ls(eSw), 
                       " but you apparently typed ", ls(eUsr), "."))
      return(FALSE)
    } else {
      # Append the result, as a list to e$delta for progress restoration
      e$delta <- c(e$delta, as.list(eUsr))
    }
  }
  # Check for effective equality of the models
  isTRUE(all.equal(sort(as.vector(mdlUsr$coefficients)), sort(as.vector(mdlSw$coefficients)))) &
    isTRUE(all.equal(mdlUsr$fitted.values, mdlSw$fitted.values))
}

# Returns TRUE if the user has created a specified glm model
# with a specified name.
creates_glm_model <- function(correctExpr){
  e <- get("e", parent.frame())
  # Recreate what the user has done
  eUsr <- cleanEnv(e$snapshot)
  mdlUsr <- eval(e$expr, eUsr)
  # Append the result, as a list to e$delta for progress restoration
  e$delta <- c(e$delta, as.list(eUsr))
  # Recreate what the user should have done
  eSw <- cleanEnv(e$snapshot)
  mdlSw <- eval(parse(text=correctExpr), eSw)
  # Check whether the model's name is correct
  if(length(ls(eSw)) > 0){
    nameGood <- sum(ls(eUsr) %in% ls(eSw)) & sum(ls(eSw) %in% ls(eUsr))
    # If not, highlight the misspelling
    if(!nameGood){
      swirl_out(paste0("You seem to have misspelled the model's name. I was expecting ", ls(eSw), 
                       " but you apparenlty typed ", ls(eUsr), "."))
      return(FALSE)
    }  else {
      # Append the result, as a list to e$delta for progress restoration
      e$delta <- c(e$delta, as.list(eUsr))
    }
  }
  # Check for effective equality of the models
  isTRUE(all.equal(sort(as.vector(mdlUsr$coefficients)), sort(as.vector(mdlSw$coefficients)))) &
    identical(mdlUsr$family$family, mdlSw$family$family) &
    isTRUE(all.equal(mdlUsr$fitted.values, mdlSw$fitted.values))
}
