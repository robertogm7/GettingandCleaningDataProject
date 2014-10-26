#GettingandCleaningDataProject
##CodeBook

The file ‘/UCI HAR Dataset/README.txt’ explains the files that contains the data.

The function run_analysis gets the data of the experiment only from these files:
	* /UCI HAR Dataset/train/subject_train.txt
	* /UCI HAR Dataset/train/X_train.txt
	* /UCI HAR Dataset/train/y_train.txt
	* /UCI HAR Dataset/test/subject_test.txt
	* /UCI HAR Dataset/test/X_test.txt
	* /UCI HAR Dataset/test/y_test.txt

And uses the following files to rename the features and activities:
	* /UCI HAR Dataset/features.txt
	* /UCI HAR Dataset/activity_labels.txt

The activity number is replaced with the corresponding activity label.

This function merge the train data with the test data and **extracts only the subject, activity and the variables with mean() or std()**. Variables with the word mean in an earlier part of the name weren’t included.

As one presentation mention that the names of variables should be all lower case, descriptive and not have underscores or dots or withe spaces, the abbreviations in the variable names were replaced as following:
	* Acc -> acceleration
	* t (at the beginning) -> time
	* f (at the beginning) -> frequency
	* Gyro -> gyroscope
	* Mag -> magnitude
	* std -> standarddeviation

Also, all the variable names were changed to lower case and all the “-” and “()” were removed.

The result of the function is a tidyData that contains the average of each variable (mean and standard deviation for each measurement) for each activity and each subject. This result is in a file called “tidyData.txt” in the same directory of the function and also is a return value of the function. This tidyData has 68 columns (subject, activity, 66 variables)
 
Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.