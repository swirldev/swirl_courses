swirl courses
=============

This is a collection of courses that do not come pre-installed with the swirl R package. Some courses are used to experiment with or demonstrate new features.

For more information regarding swirl, visit [swirlstats.com](http://swirlstats.com) or the [swirl GitHub repository](https://github.com/swirldev/swirl).

### How to install and run a course from this repository

Make sure you have a recent version of swirl:

```
install.packages("swirl")
```

Some courses may require the development version of swirl:

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

For example, `install_from_swirl("Including_Data")` will install the `Including_Data` course.
