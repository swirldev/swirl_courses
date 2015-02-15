swirl courses
=============

This is a collection of interactive courses for use with the [swirl R package](http://swirlstats.com). You'll find instructions for installing courses further down on this page. Some courses are still in development and we'd love to hear any [suggestions](https://github.com/swirldev/swirl_courses/issues/new) you have as you work through them.

For more information regarding swirl, visit [swirlstats.com](http://swirlstats.com) or the [swirl GitHub repository](https://github.com/swirldev/swirl). If you'd like to write your own interactive content, please visit the [Instructors page](http://swirlstats.com/instructors.html) of our website.

Here are our current offerings, organized by level of difficulty:

#### Beginner

- **R Programming**: The basics of programming in R
- **R Programming Alt**: Same as the original, but modified slightly for in-class use (see below ***)
- **Data Analysis**: Basic ideas in statistics and data visualization
- **Mathematical Biostatistics Boot Camp**: One- and two-sample t-tests, power, and sample size
- **Open Intro**: A very basic introduction to statistics, data analysis, and data visualization

\*\*\* *R Programming Alt is identical to R Programming, except we've eliminated the prompts for Coursera credentials at the end of each lesson and instead give students the option to send an email to their instructor notifying them of completion. Admittedly, it's sort of a hack until we come up with a more robust solution for in-class use (i.e. an instructor "dashboard").*

#### Intermediate

- **Regression Models**: The basics of regression modeling in R
- **Getting and Cleaning Data**: dplyr, tidyr, lubridate, oh my!

#### Advanced

- **Statistical Inference**: This intermediate to advanced level course closely follows the
[Statistical Inference course](https://www.coursera.org/course/statinference) of the Johns Hopkins 
[Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1) on Coursera. It
introduces the student to basic concepts of statistical inference
including probability, hypothesis testing, confidence intervals and
p-values. It concludes with an initiation to topics of particular
relevance to big data, issues of multiple testing and resampling.

Since our users come from a variety backgrounds, it's very hard to label material as **Beginner**, **Intermediate**, or **Advanced**. If you find something that is labelled **Beginner** to be challenging, please don't be discouraged. The first step of learning anything is to acknowledge that you are capable of understanding it. True understanding will come with time and practice.

#### Course Authors

- **Writing swirl Courses**: An interactive guides and example 
  for swirl course authors. The first group of lesson cover basics. The rest cover 
  special topics useful primarily as samples--points of departure for one's own material.

## Install and run a course automatically from swirl

**This is the preferred method of installing courses.** It automates the process by allowing you to do everything right from the R console.

1) Make sure you have a recent version version of swirl:

```
install.packages("swirl")
```

2) Enter the following from the R console, **substituting the name of the course** that you wish to install:

```
library(swirl)
install_from_swirl("Course Name Here")
swirl()
```

For example, `install_from_swirl("R Programming")` will install the R Programming course. **Please note that course names are case sensitive!**

If that doesn't work for you...

## Install and run a course manually

If the automatic course installation method outlined above does not work for you, then there's a simple alternative.

1) Click on the **Download ZIP** button on the righthand side of this page.

2) Enter the following from the R console, **substituting the correct file path** to your downloaded file and the **name of your desired course**:

```
library(swirl)
install_course_zip("path/to/file/here/swirl_courses-master.zip", multi=TRUE, 
                   which_course="Course Name Here")
swirl()
```

For example, if you download the zip file to `~/Downloads/swirl_courses-master.zip`, then the following command will install the R Programming course.

```
install_course_zip("~/Downloads/swirl_courses-master.zip", multi=TRUE, which_course="R Programming")
```

**Please note that course names are case sensitive!**

Although we recommend you install one course at a time, if you omit the `which_course` argument, then all available courses from this repository will be installed:

```
install_course_zip("~/Downloads/swirl_courses-master.zip", multi=TRUE)
```

## Uninstall a course

If you'd like to remove a course at any time, you can use `uninstall_course("Course Name Here")`.

## Using swirl in the classroom

Instructors around the world are using swirl in their classrooms. We think this is awesome. If you're an instructor, please feel free to do the same -- free of charge. While your students may be paying to take your course or attend your institution, we simply ask that you don't charge people *directly* for the use of our software or instructional content.

If you are not sure about a particular use case, don't hesitate to send us an email at info@swirlstats.com.
