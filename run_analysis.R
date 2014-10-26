run_analysis <- function () {
    #load library
    library(reshape2)
   
    #read all files
    activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("id","activity"))
    features = read.table("./UCI HAR Dataset/features.txt")
    
    subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))
    x_train = read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features[,2])
    y_train = read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("activity"))
    
    subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))
    x_test = read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features[,2])
    y_test = read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("activity"))
    
    # 3. use descriptive activity names
    y_train <- activity_labels[y_train$activity,][2]
    y_test <- activity_labels[y_test$activity,][2]
    
    # 1. merge training and test sets
    train <- cbind(subject_train, y_train, x_train)
    test <- cbind(subject_test, y_test, x_test)
    data <- rbind(train, test)
    
    # 2. extracts the mean and standard deviation
    data <- data[,names(data) %in% grep(paste(c("subject", "activity", "mean\\.", "std\\."), collapse="|"), names(data), value=T)]
    
    # 4. label the data set with descriptive variable names
    names(data) <- gsub("Acc", "acceleration", names(data))
    names(data) <- gsub("^t", "time", names(data))
    names(data) <- gsub("^f", "frequency", names(data))
    names(data) <- gsub("Gyro", "gyroscope", names(data))
    names(data) <- gsub("Mag", "magnitude", names(data))
    names(data) <- gsub("std", "standarddeviation", names(data))
    names(data) <- tolower (names(data))
    names(data) <- gsub("\\.","",names(data),)
    
    # 5. average of each variable for each activity and each subject
    tidyMelt <- melt(data, id=c("subject", "activity"), measures.vars=names(data[3:length(names(data))]))
    tidyData <- dcast(tidyMelt, subject + activity ~ variable, mean)
    write.table(tidyData, file = "./tidyData.txt", row.names = FALSE)
    tidyData
}