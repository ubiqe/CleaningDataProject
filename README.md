#CleaningDataProject
The included script (run_analysis.R) cleans and preprocesses a smartphone study datatset to produce a tidy dataset with means for each subject and for each performed activity for selected variables.
To run the analysis you need to download the raw dataset from:  
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and unzip it into your R working directory. Put the run_analysis.R file into the working directory and source it into your global environment. The script uses Windows relative paths (i.e. double backslashes) - if you want to run the script on other systems a change into single slashes might be necessary.

===================  
The script merges the train and test datasets included in the raw zip file and joins them with activity codes, subject codes, activity labels and variable names. Then, it computes a mean value for each subject, each activity on selected variables. Included are only those variables that in the original dataset were themselves computed means and standard deviations for each measurement window (means for the angle() variable and for meanFreq are not included). The function run_analysis() returns the tidy dataset as a dataframe, that can later be dumped into a .txt file. A sample text file dump is included as well as a code book listing all variables.

===================  
**Files included:**  
run_analysis.R  
README.MD  
codeBook.MD  
tidyData.txt  

===================  
For more information on the experiment setup and the raw variables from which this script computes means, consult: README.txt and features_info.txt in the original dataset zip folder.