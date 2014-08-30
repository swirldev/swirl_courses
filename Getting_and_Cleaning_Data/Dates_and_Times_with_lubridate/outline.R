library(lubridate)
help(package=lubridate)

# Huge number of possibilities with lubridate.
# We'll just cover the basics in this lesson.
# Give you the confidence to explore further.

# Dates and date-times
today() # Current day
now() # Current time

# Pick a date in the past
ymd('1985-08-25') # most common - big to small
ymd('1985/08/25') # alternative
ymd('85-8-25') # make sure you specify year fully

# Also handles vectors of dates
ymd(c('2014-05-14', '2014-09-22'))

# Often in the US, we refer to mm/dd/yyyy
mdy('08.25.1985')
mdy('Aug 25, 1985')
mdy(08251985)

# Do whatever you want
dmy('25 August 1985')
dmy('25081985')

# But be careful, it's not magic!
ymd('1985825')

# What if we've got time too
now()
now(tzone = 'UTC')
ymd_hms('2014-08-23 17:23:02')

rn <- now()
rn_tz <- now(tzone = 'UTC')

tz(rn)
tz(rn_tz)

year(rn)
month(rn)
day(rn)
hour(rn)
minute(rn)
second(rn)

wday(rn)
wday(rn, label = TRUE)

rn

hour(rn) <- 8
rn

update(rn, year = 2050, second = 0)


# Instants - exact moment in time

# Intervals - An interval is a span of time that occurs between two specific instants. The length of an interval is never ambiguous, because we know when it occurs. Moreover, we can calculate the exact length of any unit of time that occurs during it.

# Durations - If we record the time span in seconds, it will have an exact length since seconds always have the same length.

# Periods - Periods record a time span in units larger than seconds, such as years, months, weeks, days, hours, and minutes. For convenience, we can also create a period that only uses seconds, but such a period would have the same properties as a duration.

round_date()
floor_date()
ceiling_date()





#
# - Class: text
# Output: It's been a long time since you've seen your friend, so you are both counting down the hours until you reunite.
#
#
#
# count down the minutes until you leave
# friend wants to know when to pick you up from the airport
#




