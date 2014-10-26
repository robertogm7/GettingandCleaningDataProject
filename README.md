#GettingandCleaningDataProject
##README.md

#run_analysis

To execute this functions you only need to call it without any parameters. The following files must be in the same folder of the function:
* /UCI HAR Dataset/train/subject_train.txt
* /UCI HAR Dataset/train/X_train.txt
* /UCI HAR Dataset/train/y_train.txt
* /UCI HAR Dataset/test/subject_test.txt
* /UCI HAR Dataset/test/X_test.txt
* /UCI HAR Dataset/test/y_test.txt
* /UCI HAR Dataset/features.txt
* /UCI HAR Dataset/activity_labels.txt

The function uses the library “reshape2”.

The run_analysis function reads the files mentioned above, rename the activities with the corresponding activity label and uses the features.txt to rename the variables of the data. Then, this function merge the train data with the test data and extracts only the subject, activity and the variables with mean() or std(). Then, replace the abbreviations with the corresponding word, changes all to lower case and remove “.”. Finally, this function creates a file named “tidyData.txt” in the same folder of the function and also returns the tidyData. The file and return value contains the average of each variable (mean and standard deviation for each measurement) for each activity and each subject.

The project includes the following files:
=========================================

- 'README.md’

- ‘CodeBook.md’

- ‘run_analysis.R’: Function that creates the ‘tidyData.txt’.

- ‘tidyData.txt': Shows information of the average of each variable (mean and standard deviation for each measurement) for each activity and each subject.

- 'UCI HAR Dataset/README.txt’: Explains the files that contains the data.


Notes: 
======
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.


