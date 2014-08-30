# Make data available to user in a data frame
.path2csv <- file.path(path.package('swirl'), 'Courses',
                      'Getting_and_Cleaning_Data',
                      'Grouping_and_Chaining_with_dplyr',
                      '2014-07-08.csv')
mydf <- read.csv(.path2csv, as.is = TRUE)

# To keep things moving quickly, I'm defining these variables
# upfront. This way, swirl won't try to save them in the
# progress file after each step.
cran <- tbl_df(mydf)
by_package <- group_by(cran, package)
