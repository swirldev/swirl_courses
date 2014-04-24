swirl courses
=============

This is a collection of interactive courses for use with the swirl R package. Some courses are still in development and may only run on a particular development version of swirl.

The following are some of our more popular courses: 

- R Programming
- Data Analysis
- Mathematical Biostatistics Boot Camp
- Open Intro

For more information regarding swirl, visit [swirlstats.com](http://swirlstats.com) or the [swirl GitHub repository](https://github.com/swirldev/swirl).

## How to install and run a course automatically from swirl

- Make sure you have a recent version version of swirl:

```
install.packages("swirl")
```

- Enter the following from the R console, substituting the name of the course that you wish to install:

```
library(swirl)
install_from_swirl("Course Name Here")
swirl()
```

For example, `install_from_swirl("R Programming")` will install the R Programming course. **Please note that course names are case sensitive!**

## How to install and run a course manually

If the method outlined above does not work for you, then there's a simple alternative.

- Click on the **Download Zip** button on the righthand side of this page.

- Then, enter the following from the R console, substituting the correct file path to your downloaded file and the name of your desired course:

```
library(swirl)
install_course_zip("path/to/file/here/swirl_courses-master.zip", multi=TRUE, which_course="Course Name Here")
swirl()
```

For example, if you download the zip file to `~/Downloads/swirl_courses-master.zip`, then the following command will install the R Programming course.

```
install_course_zip("~/Downloads/swirl_courses-master.zip", multi=TRUE, which_course="R Programming")
```

If you omit the `which_course` argument, then all available courses from this repository will be installed:

```
install_course_zip("~/Downloads/swirl_courses-master.zip", multi=TRUE)
```

If you'd like to remove a course, you can use `uninstall_course("Course Name Here")`.