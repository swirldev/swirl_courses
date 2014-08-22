### MAY END UP USING THIS AT SOME POINT... ###

# Code used to create dataset
# dob_start <- as.Date('1950-01-01')
# dob_end <- as.Date('1994-01-01')
# hire_start <- as.Date('1985-01-01')
# hire_end <- as.Date('1994-01-01')
# poss_dobs <- seq(dob_start, dob_end, 'days')
# poss_hires <- seq(hire_start, hire_end, 'days')
# set.seed(5234)
# dob <- sample(poss_dobs, 99, replace=TRUE)
# set.seed(1234)
# hire_date <- sample(poss_hires, 99, replace=TRUE)
# eedata <- data.frame(ee_num = 1:99, dob, hire_date)
# write.csv(eedata, file='R_Programming/Dates_and_Times/eedata.csv', 
#           row.names=FALSE)
# 
# .path2data <- file.path(path.package('swirl'), 'Courses', 'R_Programming',
#                        'Dates_and_Times', 'eedata.csv')
# eedata <- read.csv(.path2data, as.is=TRUE)
# eedata$dob <- as.Date(eedata$dob)
# eedata$hire_date <- as.Date(eedata$hire_date)
