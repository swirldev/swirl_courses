#' DIRECTIONS: 
#' 1. Source this file and invoke newLesson(courseName, lessonName), where
#' courseName and lessonName are strings of your choice such as "My Course" and 
#' "My Lesson 1". Spaces are allowed in course and lesson names.
#' This will create a file such as My_Course/My_Lesson_1/lesson.yaml.
#' The file should appear in the editor automatically. If not, open it manually.
#' 
#' 2. Fill in the course meta-information, Author, Organization, etc. as indicated in 
#' lesson.yaml. 
#' 
#' 3. Append instructional units such as multiple-choice questions to lesson.yaml by
#' invoking appropriate helper functions. Type hlp() for a brief list. Typing qmult(),
#' for instance would append the following template to lesson.yaml:
#' - Class: mult_question  
#'   Output: ask the multiple choice question here
#'   AnswerChoices: ANS;2;3
#'   CorrectAnswer: ANS
#'   AnswerTests: omnitest(correctVal= 'ANS')
#'   Hint: hint
#' which might be manually edited as follows.
#' - Class: mult_question  
#'   Output: This demonstrates a multiple choice question. Which Scooby-Doo character wears an ascot?
#'   AnswerChoices: Fred Jones;Velma Dinkley;Daphne Blake;Shaggy Rogers
#'   CorrectAnswer: Fred Jones
#'   AnswerTests: omnitest(correctVal= 'Fred Jones')
#'   Hint: This person doesn't say "Jinkies."
#'   
#' 4. Save lesson.yaml whenever you append and edit a unit of instruction.
#' 
#' 5. Strings may take more than one line provided they are surrounded by double quotes. For instance,
#' in the following question the Output: field takes up two lines:
#' - Class: text_question
#'   Output: "This illustrates a question requiring a single phrase text answer. 
#' What is the name of the van which carries Scooby's gang?"
#'   CorrectAnswer: Mystery Machine
#'   AnswerTests: omnitest(correctVal='Mystery Machine')
#'   Hint: The gang generally solves a M------? It's the M------ Machine.

newLesson <- function(course, lesson){
  courseDir <- file.path(gsub(" ", "_", course))
  lessonDir <<- file.path(courseDir, gsub(" ", "_", lesson))
  if(!file.exists(lessonDir))dir.create(lessonDir, recursive=TRUE)
  # Check for existence of a manifest
  manifest <- file.path(courseDir, "MANIFEST")
  if(!file.exists(manifest)){
    file.create(manifest)
  }
  # Append the current lesson to the manifest
  cat(paste0(gsub(" ", "_", lesson), "\n"), file=manifest, append=TRUE)
  # The yaml faq, http://www.yaml.org/faq.html, encourages
  # use of the .yaml (as opposed to .yml) file extension
  # whenever possible.
  lessonFile <<- file.path(lessonDir, "lesson.yaml")
  writeLines(c("- Class: meta", 
               paste("  Course:", course),
               paste("  Lesson:", lesson),
               "  Author: your name goes here",
               "  Type: Standard",
               "  Organization: your organization",
               paste("  Version: ", packageDescription("swirl")$Version)),
             lessonFile)
  # Create supporting files
  depends <- file.path(lessonDir, "dependson.txt")
  file.create(depends)
  init <- file.path(lessonDir, "initLesson.R")
  file.create(init)
  cat("# Code placed in this file will be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.\n", file=init)
  custom <- file.path(lessonDir, "customTests.R")
  file.create(custom)
  cat("# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, expr_creates_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.\n", 
      file=custom)
  file.edit(lessonFile)
}

setLesson <- function(course, lesson){
  courseDir <- file.path(gsub(" ", "_", course))
  lessonDir <- file.path(courseDir, gsub(" ", "_", lesson))
  lessonFile <- file.path(lessonDir, "lesson.yaml")
  if(!file.exists(lessonFile)){
    stop(paste("Sorry!", lessonFile, "doesn't exist. Check the path."))
  } else {
    lessonDir <<- lessonDir
    lessonFile <<- lessonFile
    file.edit(lessonFile)
  }
}

# yaml writer help
hlp <- function(){
  print("txt -- just text, no question")
  print("qmult -- multiple choice question")
  print("qcmd -- command line question")
  print("vid -- video")
  print("fig -- figure")
  print("qx -- question requiring exact numerical answer")
  print("qtxt -- question requiring a short text answer")
  print("qrng -- question requiring a numerical answer within a certain range.")
}

# template for presentation without a question
txt <- function(){
  cat("\n- Class: text
  Output: put your exposition here.\n", file=lessonFile, append=TRUE)
  invisible()
}

# template for multiple choice question
qmult <- function(){
  cat("\n- Class: mult_question  
  Output: ask the multiple choice question here
  AnswerChoices: ANS;2;3
  CorrectAnswer: ANS
  AnswerTests: omnitest(correctVal= 'ANS')
  Hint: hint\n", file=lessonFile, append=TRUE)
  invisible()
}

qcmd <- function(){
  cat("\n- Class: cmd_question
  Output: explain what the user must do here
  CorrectAnswer: EXPR or VAL
  AnswerTests: omnitest(correctExpr='EXPR', correctVal=VAL)
  Hint: hint\n", file=lessonFile, append=TRUE)
  invisible()
}

vid <- function(){
  cat("\n- Class: video
  Output: Would you like to watch a short video about ___?
  VideoLink: 'http://address.of.video'\n", file=lessonFile, append=TRUE)
  invisible()
}

fig <- function(){
  cat("\n- Class: figure
  Output: explain the figure here
  Figure: sourcefile.R
  FigureType: new or add\n", file=lessonFile, append=TRUE)
  invisible()
}

qx<- function(){
  cat("\n- Class: exact_question
  Output: explain the question here
  CorrectAnswer: n
  AnswerTests: omnitest(correctVal=n)
  Hint: hint\n", file=lessonFile, append=TRUE)
invisible()
}

qtxt <- function(){
  cat("\n- Class: text_question
  Output: explain the question here
  CorrectAnswer: answer
  AnswerTests: val_matches('regular_expression_which_matches_answer')
  Hint: hint\n", file=lessonFile, append=TRUE)
invisible()
}

qrng <- function(){
  cat("\n- Class: range_question
  Output: explain the question here
      CorrectAnswer: answer
      AnswerTests: requires a custom test
      Hint: hint\n", file=lessonFile, append=TRUE)
  invisible()
}


reinstall <- function(){
  course <- dirname(lessonDir)
  # Uninstall_course
  try(swirl::uninstall_course(course), silent=TRUE)
  # Install course
  swirl::install_course_directory(gsub(" ", "_", course))
}
