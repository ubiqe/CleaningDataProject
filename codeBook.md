#Code book for cleaning data project
===================
This file describes the variables returned as a dataframe by run_analysis() function. The function works on a original dataset accessible from: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
For details on original variables consult features_info.txt in the dataset. In brief, participants performed 6 activities carrying a smartphone that measured their 3-axial acceleration and 3-axial angular velocity. The measurements were acquired at 50Hz rate and then divided into overlapping time windows (128 measurements each). For each time window a selection of variables was computed from these raw signals (both in time and frequency domains), including a mean and standard deviation. 
===================
From these variables denoting means and standard deviations (means computed for the angle() variable and meanFreq() are not included), the function run_analysis() computes an average for each subject, each activity, giving in total 180 observations (30 subjects x 6 activities) on 68 variables, as follows (-XYZ denotes 3 variables, one for each axis; -mean()std() denotes 2 variables for mean and standard deviation):

Subject
Activity
tBodyAcc-XYZ-mean()std()
tGravityAcc-XYZ-mean()std()
tBodyAccJerk-XYZ-mean()std()
tBodyGyro-XYZ-mean()std()
tBodyGyroJerk-XYZ-mean()std()
tBodyAccMag-mean()std()
tGravityAccMag-mean()std()
tBodyAccJerkMag-mean()std()
tBodyGyroMag-mean()std()
tBodyGyroJerkMag-mean()std()
fBodyAcc-XYZ-mean()std()
fBodyAccJerk-XYZ-mean()std()
fBodyGyro-XYZ-mean()std()
fBodyAccMag-mean()std()
fBodyAccJerkMag-mean()std()
fBodyGyroMag-mean()std()
fBodyGyroJerkMag-mean()std()

===================
*Units*
* The subject variable denotes participant number (1 through 30)
* Acitivity is a factor denoting the performed activity (Walking, Walking upstairs, Walking downstairs, Sitting, Standing, Laying)
* The rest of the variables are measurements of acceleration and angular velocity, divided into body and gravity components, and normalized to <-1.0, 1.0>. For details, consult features_info.txt in the original dataset.