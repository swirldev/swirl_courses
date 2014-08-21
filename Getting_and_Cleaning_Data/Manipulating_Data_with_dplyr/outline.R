### Manipulating data with dplyr - Getting and Cleaning Data ###

# Code to download data
# logurl <- 'http://cran-logs.rstudio.com/2014/2014-07-08.csv.gz'
# filepath <- paste0('~/', basename(logurl))
# download.file(logurl, filepath)
# cranlog <- read.csv(filepath)
# write.csv(cranlog, '~/Desktop/2014-07-08.csv')
# unlink(filepath)

path2csv <- file.path('~/Desktop/2014-07-08.csv')


### Intro
df <- read.csv(path2csv, as.is = TRUE)
dim(df)
head(df)
library(dplyr)
cran <- tbl_df(df)
cran
?manip

# "The dplyr philosophy is to have small functions that each do
# one thing well."


### select()
select(cran, ip_id, package, country) # reorders
select(cran, r_arch:country)
select(cran, -(X:time))
select(cran, ip_id:size)

### filter()
filter(cran, package == "swirl")
filter(cran, r_version == "3.1.1", country == "US")
filter(cran, country == "US" | country == "CA")
filter(cran, r_version >= "3.0.0", r_os == "linux-gnu")
filter(cran, !is.na(package))

### arrange()
arrange(cran, ip_id)
arrange(cran, package, ip_id)
arrange(cran, country, desc(r_version), ip_id)
arrange(cran, package, desc(version), ip_id)

### mutate()
cran1 <- select(cran, ip_id, package, size)
mutate(cran1, size_mb = size / 2^20)
mutate(cran1, size_mb = size / 2^20, size_gb = size_mb / 2^10)

### summarize()
summarize(cran, avg_bytes = mean(size))
