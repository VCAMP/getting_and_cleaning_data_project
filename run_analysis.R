###Course project script for Getting and Cleaning Data###

## Step 0: Getting the data, extracting the relevant files and setting up the 
## work directory in the folder where the files have been unzipped. Note that 
## unzip() will automatically create a new destination directory if necessary. If you
## don't have Internet access but have all relevant data set files extracted in your
## working directory, you can comment out this section of the script to make it run. ##


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="initial_data_set.zip")

filelist <- c("UCI HAR Dataset/activity_labels.txt", 
              "UCI HAR Dataset/features.txt", 
              "UCI HAR Dataset/train/subject_train.txt", 
              "UCI HAR Dataset/train/X_train.txt", 
              "UCI HAR Dataset/train/y_train.txt", 
              "UCI HAR Dataset/test/subject_test.txt", 
              "UCI HAR Dataset/test/X_test.txt", 
              "UCI HAR Dataset/test/y_test.txt")

unzip("initial_data_set.zip", files=filelist, junkpaths=TRUE, exdir="./UCI HAR_new")
setwd("./UCI HAR_new/")

## Step 1: Reading the data set into R and rebuilding it into a single data 
## frame. ##

activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
subject_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

all_subjects <- rbind(subject_train, subject_test)
all_activities <- rbind(y_train, y_test)
all_measurements <- rbind(x_train, x_test)
rebuilt_data_set <- cbind(all_subjects, all_activities, all_measurements)

## Step 2: Selecting only the measurements of the mean and standard deviation.
## NB: this step purposefully excludes measurements of meanFreq() - see Code Book for 
## details. ##

features_vector <- as.character(features [, 2])
logical_only_needed_measurements <- grepl("mean\\(\\)|std\\(\\)", features_vector)
logical_only_needed_cols <- c(c(TRUE, TRUE), logical_only_needed_measurements) 
relevant_data_set <- rebuilt_data_set[, logical_only_needed_cols]

## Step 3: Assigning descriptive activity names to the activity column in the 
## data set. ##

activity_vector <- as.character(activity_labels [, 2])
relevant_data_set[, 2] <- as.factor(relevant_data_set[, 2])
levels(relevant_data_set[, 2]) <- activity_vector

## Step 4: Assigning variable names to the data set. ##

features_vector <- as.character(features[, 2])
relevant_feature_names <- subset(features_vector, logical_only_needed_measurements)
relevant_feature_names <- gsub("^t", "time", relevant_feature_names)
relevant_feature_names <- gsub("^f", "frequency", relevant_feature_names)
relevant_feature_names <- gsub("Acc", "Accelerometer", relevant_feature_names)
relevant_feature_names <- gsub("Gyro", "Gyroscope", relevant_feature_names)
relevant_feature_names <- gsub("Mag", "Magnitude", relevant_feature_names)
relevant_feature_names <- gsub("BodyBody", "Body", relevant_feature_names)
relevant_feature_names <- gsub("std\\(\\)", "standardDeviation", relevant_feature_names)
relevant_feature_names <- gsub("mean\\(\\)", "mean", relevant_feature_names)
relevant_feature_names <- tolower(relevant_feature_names)
colnames(relevant_data_set) <- c("subject", "activity", relevant_feature_names)

## Step 4a: Cleaning up some memory. ##

rm(all_activities, all_measurements, all_subjects, rebuilt_data_set, subject_test, subject_train, x_test, x_train, y_test, y_train)

## Step 5: Creating an independent, tidy data set with the average of each 
## variable for each activity and each subject. ##

library(reshape2)
melted_data <- melt(relevant_data_set, id=c("subject", "activity"))
wide_tidy_data <- dcast(melted_data, subject + activity ~ variable, mean)

## Step 5a: (optional) converting the "wide" tidy frame created in the previous
## passage into a "long" tidy data frame. ##

#long_tidy_data <- dcast(melted_data, subject + activity + variable ~ ., mean)
#colnames(long_tidy_data)[4] <- c("value")

## Step 6: Writing the tidy data set to a .txt file. ##

write.table(wide_tidy_data, file="Samsung_Data.txt", row.names=FALSE)