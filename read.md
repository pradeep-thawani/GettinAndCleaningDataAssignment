Steps:
Pre req:  extract the zip file UCI HAR Dataset.zip file in the current working directory.
1) Create test Data set
	- Read the data set from X_test.txt
	- Read Features.txt and use it as column names for the test data set
	- Read y_test and added it as column activityid in test data set
	- Read subject_test.txt and added it as a column subjectid in test data set
2) Create train Data set
	- Read the data set from X_train.txt
	- Read Features.txt and use it as column names for the test data set
	- Read y_train and added it as column activityid in test data set
	- Read subject_train.txt and added it as a column subjectid in test data set
3) Merged both test and train data set
4) Extract the measurements on the mean and standard deviation
5) Made the tidy data set using group_by on subjectid, activityid and summarising all the columns.