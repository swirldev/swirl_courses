lespath <- "inst/Courses/Test_Lessons/Using_omnitest/lesson.csv"

saveles <- function(){
  write.csv(lesson, lespath, row.names=FALSE)
}

newrow <- function(Class=NA, Output=NA, CorrectAnswer=NA, 
                   AnswerChoices=NA, AnswerTests=NA, Hint=NA, Figure=NA,
                   FigureType=NA, VideoLink=NA){
  temp <- data.frame(Class=Class, Output=Output, CorrectAnswer=CorrectAnswer, 
                     AnswerChoices=AnswerChoices, AnswerTests=AnswerTests, 
                     Hint=Hint, Figure=Figure, FigureType=FigureType, 
                     VideoLink=VideoLink)
}

lesson <- newrow(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

# just text, no question
lesson <- rbind(lesson, newrow(
  Class="text", 
  Output="This is a brief demonstration of function omnitest. Omnitest can grade student answers for a correct expression, a correct value, or both. In the case of values it is limited to testing for character or numerical vectors of length 1. Omnitest's general signature is: omnitest(correctExpr=NULL, correctVal=NULL, strict=FALSE)"
  ))
# multiple choice question
lesson <- rbind(lesson, newrow(
  Class="mult_question",
  Output="First, I'll use omnitest(correctVal='Mamma Mia!') for the answer to a multiple choice question: Which movie involves Pierce Brosnan in a singing role?",
  AnswerChoices="Mamma Mia!;Guys and Dolls;Once is Not Enough",
  CorrectAnswer="Mamma Mia!",
  AnswerTests="omnitest(correctVal='Mamma Mia!')",
  Hint = "In Guys and Dolls, Marlon Brando sings. In Once is Not Enough, 007 doesn't."
  ))

# User must give an exact, numerical answer
lesson <- rbind(lesson, newrow(
  Class="exact_question",
  Output="Next, I'll use omnitest(correctVal=3) for an exact numerical answer entered at the command line: How many Stooges are there?",
  CorrectAnswer=3,
  AnswerTests="omnitest(correctVal=3)",
  Hint="This one should be obvious! Nyuk, Nyuk, Nyuk!"
  ))

# requires user to enter a command
lesson <- rbind(lesson, newrow(
  Class="cmd_question",
  Output="Now I'll use omnitest(correctExpr='scooby <- c(1969, 2013)') to test that a user has entered a particular command: Enter scooby <- c(1969, 2013)",
  CorrectAnswer="scooby <- c(1969, 2013)",
  AnswerTests="omnitest(correctExpr='scooby <- c(1969, 2013)')",
  Hint="So far, Scooby has been on the air or in theaters from 1969 to 2013. Enter scooby <- c(1969, 2013)"
  ))

# requires user to enter a command
lesson <- rbind(lesson, newrow(
  Class="cmd_question",
  Output="Omnitest has strict and casual modes. I'll demonstrate casual, the default, by using omnitest(correctExpr='3^2', correctVal=9) to test that a user has entered a command which computes a specific value but perhaps in a different manner than anticipated. The correct expression is 3^2, but enter 3*3.",
  CorrectAnswer="3^2",
  AnswerTests="omnitest(correctExpr='3^2', correctVal=9)",
  Hint="Enter 3^2"
  ))

# requires user to enter a command
lesson <- rbind(lesson, newrow(
  Class="cmd_question",
  Output="Finally, I'll demonstrate strict mode for same question, using omnitest(correctExpr='3^2', correctVal=9, strict=TRUE) to test that a user has entered a command which computes a specific value in a particular way. The correct expression is 3^2. Entering 3*3 should fail.",
  CorrectAnswer="3^2",
  AnswerTests="omnitest(correctExpr='3^2', correctVal=9, strict=TRUE)",
  Hint="Enter 3^2"
))

# just text, no question
lesson <- rbind(lesson, newrow(
  Class="text", 
  Output="That completes the omnitest demo. Thank you."
  ))