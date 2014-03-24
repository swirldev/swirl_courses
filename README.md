swirl course repository
=======================

This is a collection of interactive courses for use with the swirl R package. Some courses are for test purposes only and may only run on a particular development version of swirl.

The following are some of our more popular courses: 

- R Programming
- Data Analysis
- Mathematical Biostatistics Boot Camp
- Open Intro

For more information regarding swirl, visit [swirlstats.com](http://swirlstats.com) or the [swirl GitHub repository](https://github.com/swirldev/swirl).

### How to install and run a course from this repository

Make sure you have a recent version of swirl:

```
install.packages("swirl")
```

If you wish to install the development version of swirl:

```
library(devtools)
install_github("swirldev/swirl")
```

Then, from the R console:

```
library(swirl)
install_from_swirl("Course_Directory")
swirl()
```

For example, `install_from_swirl("R_Programming")` will install the `R Programming` course.
