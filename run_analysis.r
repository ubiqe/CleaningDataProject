##This function merges two datasets (train and test) from the smartphone study
## and returns a tidy dataset. It works provided that you have unzipped the 
##downloaded dataset into your working directory. This function uses Windows
##paths

run_analysis<-function(){
##Loading needed libraries
  library(plyr)
##Part 1 - merging datasets  
  ##Read the train & test datasets into separate data frames
  train<-read.table("UCI HAR Dataset\\train\\X_train.txt")
  test<-read.table("UCI HAR Dataset\\test\\X_test.txt")
  ##Read the subject codes for train & test datasets
  subTrain<-read.table("UCI HAR Dataset\\train\\subject_train.txt")
  subTest<-read.table("UCI HAR Dataset\\test\\subject_test.txt")
  ##Read the activity codes for train & test datasets
  actTrain<-read.table("UCI HAR Dataset\\train\\y_train.txt")
  actTest<-read.table("UCI HAR Dataset\\test\\y_test.txt")
  ##Read variable names
  features<-read.table("UCI HAR Dataset\\features.txt")
  ##Read activity labels
  activity_labels<-read.table("UCI HAR Dataset\\activity_labels.txt")
  ##Prepare a factor variable for activities in the train and test datasets
  activityTrain<-factor(actTrain[,1], levels=1:6, labels=sapply(activity_labels[,2], function(x){sub("_"," ", gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", x, perl=TRUE))}))
  activityTest<-factor(actTest[,1], levels=1:6, labels=sapply(activity_labels[,2], function(x){sub("_"," ", gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", x, perl=TRUE))}))
  ##Add subject and activity codes to the train and test data frames
  fullTrain<-cbind(subTrain, activityTrain, train)
  fullTest<-cbind(subTest, activityTest, test)
  ##Add variable names
  names(fullTrain)<-c("Subject", "Activity", as.character(features[,2]))
  names(fullTest)<-c("Subject", "Activity", as.character(features[,2]))
  ##Merge datasets
  full<-rbind(fullTrain, fullTest)
  full<-full[order(full$Subject),]
##Part 2 - extracting only means and standard deviations
  ##Prepare a vector with column numbers for subject, activity, means and stds
  means<-grep("mean()", features[,2], fixed=TRUE)
  stds<-grep("std", features[,2], fixed=TRUE)
  columns<-sort(c(1,2,means+2,stds+2))
  truncated<-full[,columns]
##Part 3 - preparing a dataset with averaged data for each activity and subject
  final<-ddply(truncated,.(Subject,Activity), colwise(mean))
  return(final)
}