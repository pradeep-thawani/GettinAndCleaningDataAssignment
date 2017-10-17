library("dplyr")
#Create test data set
testData <- read.table("UCI HAR Dataset\\test\\X_test.txt")
headers <- read.table("UCI HAR Dataset\\features.txt")
colnames(testData) <- headers$V2
yTest <- read.table("UCI HAR Dataset\\test\\y_test.txt")
subjectTest <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
testData$subjectid <- subjectTest$V1
testData$activityid <- yTest$V1

#Create train data set
trainData <- read.table("UCI HAR Dataset\\train\\X_train.txt")
colnames(trainData) <- headers$V2
yTrain <- read.table("UCI HAR Dataset\\train\\y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
trainData$subjectid <- subjectTrain$V1
trainData$activityid <- yTrain$V1

#merge two datasets
mixedData <- rbind(testData,trainData)
#Extract the measurements on the mean and standard deviation
columnLogical <- grepl("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]|subjectid|activityid", names(mixedData))
filteredData <- mixedData[, columnLogical]
filteredData$activityid <- gsub("1","WALKING", filteredData$activityid)
filteredData$activityid <- gsub("2","WALKING_UPSTAIRS", filteredData$activityid)
filteredData$activityid <- gsub("3","WALKING_DOWNSTAIRS", filteredData$activityid)
filteredData$activityid <- gsub("4","SITTING", filteredData$activityid)
filteredData$activityid <- gsub("5","STANDING", filteredData$activityid)
filteredData$activityid <- gsub("6","LAYING", filteredData$activityid)
headers <- sub("^t","time",names(filteredData))
headers <- sub("^f","freq",headers)
colnames(filteredData) <- headers
filteredData <- filteredData[,c(87,88,1:86)]

# make the tidy data set
Data <- filteredData %>%
    group_by(subjectid,activityid) %>%
    summarise_all(funs(mean))

