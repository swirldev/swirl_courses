# Load the galton data from a csv file included in the lesson, using a utility to
# find the lesson directory.

galton <- read.csv(file.path(find_course("Writing_swirl_Courses"),
                             "Other_Question_Types", "galton.csv"))

# Create a jittered scatter plot
plot(jitter(child, 4) ~ jitter(parent, 6), data=galton, 
     xlab="Parent's height (in)", ylab="Child's height (in)",
     main="Galton Parent/Child Height Data")
# Add a regression line
abline(lm(child ~ parent, data=galton), lwd=3, col="blue")

# Display this source code file
display_swirl_file("galtonPlot.R", "Writing_swirl_Courses", "Other_Question_Types")
