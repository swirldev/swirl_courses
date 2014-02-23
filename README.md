swirl courses
=============

This is a collection of courses that do not come pre-installed with the swirl R package. Some courses are only used for the purpose of testing new features and may not even be functional.

For more information regarding swirl, visit [swirlstats.com](http://swirlstats.com) or the [swirl GitHub repository](https://github.com/swirldev/swirl).

### How to install and run a course from this repository

Make sure you have a recent version of swirl:

```
install.packages("swirl")
```

Then, from the R console:

```
library(swirl)
install_from_swirl("Course directory name goes here")
swirl()
```

For example, `install_from_swirl("compdata-004")` will install the `compdata-004` course.