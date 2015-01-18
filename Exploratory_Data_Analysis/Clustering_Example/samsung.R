
## This file must be run in the 
## UCI HAR Dataset/ directory

xvals <- read.table("train/X_train.txt")
yvals <- read.table("train/Y_train.txt")
features <- read.table('features.txt')
subject <- read.table("train/subject_train.txt")


colnames(xvals) <- features[,2]
yvals <- yvals[,1]
yvals[yvals==1]="walk"
yvals[yvals==2]="walkup"
yvals[yvals==3]="walkdown"
yvals[yvals==4]="sitting"
yvals[yvals==5]="standing"
yvals[yvals==6]="laying"

xvals$subject <- subject[,1]
xvals$activity <- yvals

samsungData <- xvals

save(samsungData,file="samsungData.rda")
