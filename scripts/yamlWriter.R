#' DIRECTIONS: 
#' 1. Source this file and invoke newYaml(courseName, lessonName), where
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

newYaml <- function(course, lesson){
  lessonDir <<- file.path(gsub(" ", "_", course), gsub(" ", "_", lesson))
  if(!file.exists(lessonDir))dir.create(lessonDir, recursive=TRUE)
  writeLines("# Put initialization code in this file.", file.path(lessonDir,"initLesson.R"))
  writeLines("# Put custom tests in this file.", file.path(lessonDir,"customTests.R")) 
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
               "  Version: 2.1.0"),
             lessonFile)
  file.edit(lessonFile)
}

# yaml writer help
hlp <- function(){
  print("newYaml(course, lesson) -- create a new yaml lesson")
  print("txt -- just text, no question")
  print("qmult -- multiple choice question")
  print("qcmd -- command line question")
  print("vid -- video")
  print("fig -- figure")
  print("qx -- question requiring exact numerical answer")
  print("qtxt -- question requiring a short text answer")
}

# template for presentation without a question
txt <- function(){
  lessonFileCheck()
  cat("\n- Class: text
  Output: put your exposition here.\n", file=lessonFile, append=TRUE)
  invisible()
}

# template for multiple choice question
qmult <- function(){
  lessonFileCheck()
  cat("\n- Class: mult_question  
  Output: ask the multiple choice question here
  AnswerChoices: ANS;2;3
  CorrectAnswer: ANS
  AnswerTests: omnitest(correctVal= 'ANS')
  Hint: hint\n", file=lessonFile, append=TRUE)
  invisible()
}

qcmd <- function(){
  lessonFileCheck()
  cat("\n- Class: cmd_question
  Output: explain what the user must do here
  CorrectAnswer: EXPR or VAL
  AnswerTests: omnitest(correctExpr='EXPR', correctVal=VAL)
  Hint: hint\n", file=lessonFile, append=TRUE)
  invisible()
}

vid <- function(){
  lessonFileCheck()
  cat("\n- Class: video
  Output: Would you like to watch a short video about ___?
  VideoLink: 'http://address.of.video'\n", file=lessonFile, append=TRUE)
  invisible()
}

fig <- function(){
  lessonFileCheck()
  cat("\n- Class: figure
  Output: explain the figure here
  Figure: sourcefile.R
  FigureType: new or add\n", file=lessonFile, append=TRUE)
  invisible()
}

qx<- function(){
  lessonFileCheck()
  cat("\n- Class: exact_question
  Output: explain the question here
  CorrectAnswer: n
  AnswerTests: omnitest(correctVal=n)
  Hint: hint\n", file=lessonFile, append=TRUE)
invisible()
}

qtxt <- function(){
  lessonFileCheck()
  cat("\n- Class: text_question
  Output: explain the question here
  CorrectAnswer: answer
  AnswerTests: omnitest(correctVal='answer')
  Hint: hint\n", file=lessonFile, append=TRUE)
invisible()
}

lessonFileCheck <- function(){
  while(!exists("lessonFile", globalenv()) || !file.exists(lessonFile)){
    course <- gsub(" ", "_", readline("Course name? "))
    lesson <- gsub(" ", "_", readline("Lesson name? "))  
    lessonFile <<- file.path(course, lesson)
  }
}