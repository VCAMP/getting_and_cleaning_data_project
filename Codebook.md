---
title: "CodeBook.md"
date: "Saturday, April 25, 2015"
output: html_document
---


##Introduction

This is a Code Book markdown file detailing my work on the course project for "Getting and cleaning data", the third course in the Coursera Data Science specialisation track. I have included information about the original data set, but I would advise markers to skip directly to "Modifications to the original data" for an explanation of my data manipulation choices.

##Contents

1. Study design
    * Original data set
    * Original variables
    * Modifications to the original data
2. Code book
    * Summary choices
    * Variable descriptions
3. Final notes

##Study design

###Original data set

The original data for the course project was obtained at [this address](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The data was collected during a series of experiments conducted by researchers at the Università degli Studi di Genova.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, lying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the smartphone's embedded accelerometer and gyroscope, the researchers captured measurements on 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The original data set included the following files:

- 'README.txt'

- 'features_info.txt': Shows detailed information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

The following files were also available for both the train and test data. Their descriptions are equivalent. 

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total\_\acc\_x\_train.txt': The acceleration signal from the smartphone accelerometer x-axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total\_acc\_x\_train.txt' and 'total\_acc\_z\_train.txt' files for the Y and z-axis. 

- 'train/Inertial Signals/body\_acc\_x\_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body\_gyro\_x\_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
 
###Original variables

The features selected for the data set come from the accelerometer and gyroscope 3-axial raw signals (tAcc-XYZ) and (tGyro-XYZ). These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

-tBodyAcc-XYZ
-tGravityAcc-XYZ
-tBodyAccJerk-XYZ
-tBodyGyro-XYZ
-tBodyGyroJerk-XYZ
-tBodyAccMag
-tGravityAccMag
-tBodyAccJerkMag
-tBodyGyroMag
-tBodyGyroJerkMag
-fBodyAcc-XYZ
-fBodyAccJerk-XYZ
-fBodyGyro-XYZ
-fBodyAccMag
-fBodyAccJerkMag
-fBodyGyroMag
-fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

-mean(): Mean value
-std(): Standard deviation
-mad(): Median absolute deviation 
-max(): Largest value in array
-min(): Smallest value in array
-sma(): Signal magnitude area
-energy(): Energy measure. Sum of the squares divided by the number of values. 
-iqr(): Interquartile range 
-entropy(): Signal entropy
-arCoeff(): Autorregresion coefficients with Burg order equal to 4
-correlation(): correlation coefficient between two signals
-maxInds(): index of the frequency component with largest magnitude
-meanFreq(): Weighted average of the frequency components to obtain a mean frequency
-skewness(): skewness of the frequency domain signal 
-kurtosis(): kurtosis of the frequency domain signal 
-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
-angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

-gravityMean
-tBodyAccMean
-tBodyAccjerk signal mean
-tBodyGyroMean
-tBodyGyrojerk signal mean

### Modifications to the original data

I have excluded the files contained in the 'Inertial Signals' folder, as they did not contain data needed for the course project. I have used the following files to rebuild the needed portion of the experiment's data set: 

- 'features.txt'
- 'activity_labels.txt'
- 'X_train.txt'
- 'y_train.txt'
- 'X_test.txt'
- 'y_test.txt'
- 'subject_train.txt'
- 'subject_test.txt'

The data was read into R using the read.table() function. The numeric ids of the test subjects were extracted from 'subject\_train.txt' and 'subject\_test.txt'. The numeric ids of the activities performed by the test subjects were extracted from 'y\_train.txt' and 'y\_test.txt'; in accordance with the instructions provided at step 3 of the project outline, **these were renamed using the labels contained in 'activity_labels.txt'** (_however, I didn't really bother to change "LAYING" into something correct ;-)_ ). Finally, all measurements values were extracted from 'X\_train.txt' and 'X\_test.txt'.

In accordance with the instructions provided in step 2 of the project outline [project instructions](https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions), **the data was subset to include only the measurements on the mean and standard deviation for each measurement**. 

As the wording of the instructions was ambiguous at best, I decided to **include only measurement variables containing the strings "mean()"or "std()"** (more about this in the Readme.rmd file). This means that meanFreq() and all the averaged values for the angle() measurements (angle(gravityMean), angle(tBodyAccMean), angle(tBodyAccjerk signal mean), angle(tBodyGyroMean), angle(tBodyGyrojerk signal mean)) were excluded from the final data set (my decision was influenced by this [series of forum posts](https://class.coursera.org/getdata-013/forum/thread?thread_id=147#post-605)).

As per the instructions provided at step 5 of the project outline, the subset of the original data set was finally turned into a **second, independent tidy data set with the average of each measurement variable for each activity and each subject**.

##Code Book

###Summary choices

The measurement variable names have all been lowercased and modified using the following substitutions:

- "time" for "t"
- "frequency" for "f"
- "Accelerometer" for "Acc"
- "Gyroscope" for "Gyro"
- "Magnitude" for "Mag"
- "Body" for "BodyBody"
- "standardDeviation" for "std()"
- "mean" for "mean()"

So, "tBodyAcc-mean()-X" was turned into "timebodyaccelerometer-mean-x".

The data has been shaped into a [tidy](http://www.jstatsoft.org/v59/i10/paper) (i.e., each variable forming a column, each observation forming a row, each type of observational unit forming a table), "wide" data set with 180 observations of 68 variables. There appears to be no clear-cut answer as to whether a "wide" or "long" data format is the ideal choice for this project. In case you favour a "long" format, **I have included in my script for the project an additional section (5a, currently commented out) that reshapes the data in "long format"** (only 4 variables).

###Variables

NB all variables apart from "subject" and "activity" have been summarised by taking the average value across each subject and activiy of each relevant measurement. The unit of measure for these variables is not explicitly stated in the readme files of the original data set, but we can assume it's [g](http://en.wikipedia.org/wiki/G-force).

* subject

Unique ids of the test subjects, ranging from 1 to 30.

* activity

Name of the activity performed by the test subjects. The six activities are WALKING,            WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING

* timebodyaccelerometer-mean-x

Time domain body motion component from the accelerometer signal measurement - mean, x-axis 

* timebodyaccelerometer-mean-y

Time domain body motion component from the accelerometer signal measurement - mean, y-axis 

* timebodyaccelerometer-mean-z

Time domain body motion component from the accelerometer signal measurement - mean, z-axis 

* timebodyaccelerometer-standarddeviation-x

Time domain body motion component from the accelerometer signal measurement - standard deviation, x-axis

* timebodyaccelerometer-standarddeviation-y

Time domain body motion component from the accelerometer signal measurement - standard deviation, y-axis 

* timebodyaccelerometer-standarddeviation-z

Time domain body motion component from the accelerometer signal measurement - standard deviation, z-axis 

* timegravityaccelerometer-mean-x

Time domain gravitational component from the accelerometer signal measurement - mean, x-axis  

* timegravityaccelerometer-mean-y

Time domain gravitational component from the accelerometer signal measurement - mean, y-axis 

* timegravityaccelerometer-mean-z

Time domain gravitational component from the accelerometer signal measurement - mean, z-axis 

* timegravityaccelerometer-standarddeviation-x

Time domain gravitational component from the accelerometer signal measurement - standard deviation, x-axis

* timegravityaccelerometer-standarddeviation-y

Time domain gravitational component from the accelerometer signal measurement - standard deviation, y-axis 

* timegravityaccelerometer-standarddeviation-z

Time domain gravitational component from the accelerometer signal measurement - standard deviation, z-axis 

* timebodyaccelerometerjerk-mean-x

Time domain body motion component from the accelerometer signal measurement - jerk signal mean, x-axis 

* timebodyaccelerometerjerk-mean-y

Time domain body motion component from the accelerometer signal measurement - jerk signal mean, y-axis

* timebodyaccelerometerjerk-mean-z

Time domain body motion component from the accelerometer signal measurement - jerk signal mean, z-axis

* timebodyaccelerometerjerk-standarddeviation-x

Time domain body motion component from the accelerometer signal measurement - jerk signal standard deviation, x-axis

* timebodyaccelerometerjerk-standarddeviation-y

Time domain body motion component from the accelerometer signal measurement - jerk signal standard deviation, y-axis

* timebodyaccelerometerjerk-standarddeviation-z

Time domain body motion component from the accelerometer signal measurement - jerk signal standard deviation, z-axis

* timebodygyroscope-mean-x

Time domain body motion component from the gyroscope signal measurement - mean, x-axis 

* timebodygyroscope-mean-y

Time domain body motion component from the gyroscope signal measurement mean, y-axis

* timebodygyroscope-mean-z

Time domain body motion component from the gyroscope signal measurement mean, z-axis 

* timebodygyroscope-standarddeviation-x

Time domain body motion component from the gyroscope signal measurement - standard deviation, x-axis

* timebodygyroscope-standarddeviation-y

Time domain body motion component from the gyroscope signal measurement - standard deviation, y-axis 

* timebodygyroscope-standarddeviation-z

Time domain body motion component from the gyroscope signal measurement - standard deviation, z-axis 

* timebodygyroscopejerk-mean-x

Time domain body motion component from the gyroscope signal measurement - jerk signal mean, x-axis 

* timebodygyroscopejerk-mean-y

Time domain body motion component from the gyroscope signal measurement jerk signal mean, y-axis 

* timebodygyroscopejerk-mean-z

Time domain body motion component from the gyroscope signal measurement jerk signal mean, z-axis 

* timebodygyroscopejerk-standarddeviation-x

Time domain body motion component from the gyroscope signal measurement jerk signal standard deviation, x-axis 

* timebodygyroscopejerk-standarddeviation-y

Time domain body motion component from the gyroscope signal measurement jerk signal standard deviation, y-axis 

* timebodygyroscopejerk-standarddeviation-z

Time domain body motion component from the gyroscope signal measurement jerk signal standard deviation, z-axis 

* timebodyaccelerometermagnitude-mean

Time domain body motion component from the accelerometer signal measurement magnitude-mean

* timebodyaccelerometermagnitude-standarddeviation

Time domain body motion component from the accelerometer signal measurement magnitude-standarddeviation

* timegravityaccelerometermagnitude-mean

Time domain gravitational component from the accelerometer signal measurement magnitude-mean

* timegravityaccelerometermagnitude-standarddeviation

Time domain gravitational component from the accelerometer signal measurement magnitude-standarddeviation

* timebodyaccelerometerjerk signal magnitude mean

Time domain body motion component from the accelerometer signal measurement jerk signal magnitude mean

* timebodyaccelerometerjerk signal magnitude standard deviation

Time domain body motion component from the accelerometer signal measurement jerk signal magnitude standard deviation

* timebodygyroscopemagnitude-mean

Time domain body motion component from the gyroscope signal measurement magnitude-mean

* timebodygyroscopemagnitude-standarddeviation

Time domain body motion component from the gyroscope signal measurement magnitude-standarddeviation

* timebodygyroscopejerk signal magnitude mean

Time domain body motion component from the gyroscope signal measurement jerk signal magnitude mean

* timebodygyroscopejerk signal magnitude standard deviation

Time domain body motion component from the gyroscope signal measurement jerk signal magnitude standard deviation

* frequencybodyaccelerometer-mean-x

Frequency domain body motion component from the accelerometer signal measurement mean, x-axis 

* frequencybodyaccelerometer-mean-y

Frequency domain body motion component from the accelerometer signal measurement mean, y-axis 

* frequencybodyaccelerometer-mean-z

Frequency domain body motion component from the accelerometer signal measurement mean, z-axis 

* frequencybodyaccelerometer-standarddeviation-x

Frequency domain body motion component from the accelerometer signal measurement standard deviation, x-axis 

* frequencybodyaccelerometer-standarddeviation-y

Frequency domain body motion component from the accelerometer signal measurement standard deviation, y-axis 

* frequencybodyaccelerometer-standarddeviation-z

Frequency domain body motion component from the accelerometer signal measurement standard deviation, z-axis 

* frequencybodyaccelerometerjerk-mean-x

Frequency domain body motion component from the accelerometer signal measurement jerk signal mean, x-axis 

* frequencybodyaccelerometerjerk-mean-y

Frequency domain body motion component from the accelerometer signal measurement jerk signal mean, y-axis 

* frequencybodyaccelerometerjerk-mean-z

Frequency domain body motion component from the accelerometer signal measurement jerk signal mean, z-axis 

* frequencybodyaccelerometerjerk-standarddeviation-x

Frequency domain body motion component from the accelerometer signal measurement jerk signal standard deviation, x-axis 

* frequencybodyaccelerometerjerk-standarddeviation-y

Frequency domain body motion component from the accelerometer signal measurement jerk signal standard deviation, y-axis 

* frequencybodyaccelerometerjerk-standarddeviation-z

Frequency domain body motion component from the accelerometer signal measurement jerk signal standard deviation, z-axis 

* frequencybodygyroscope-mean-x

Frequency domain body motion component from the gyroscope signal measurement mean, x-axis 

* frequencybodygyroscope-mean-y

Frequency domain body motion component from the gyroscope signal measurement mean, y-axis 

* frequencybodygyroscope-mean-z

Frequency domain body motion component from the gyroscope signal measurement mean, z-axis 

* frequencybodygyroscope-standarddeviation-x

Frequency domain body motion component from the gyroscope signal measurement standard deviation, x-axis 

* frequencybodygyroscope-standarddeviation-y

Frequency domain body motion component from the gyroscope signal measurement standard deviation, y-axis 

* frequencybodygyroscope-standarddeviation-z

Frequency domain body motion component from the gyroscope signal measurement standard deviation, z-axis 

* frequencybodyaccelerometermagnitude-mean

Frequency domain body motion component from the accelerometer signal measurement magnitude-mean

* frequencybodyaccelerometermagnitude-standarddeviation

Frequency domain body motion component from the accelerometer signal measurement magnitude-standarddeviation

* frequencybodyaccelerometerjerk signal magnitude mean

Frequency domain body motion component from the accelerometer signal measurement jerk signal magnitude mean

* frequencybodyaccelerometerjerk signal magnitude standard deviation

Frequency domain body motion component from the accelerometer signal measurement jerk signal magnitude standard deviation

* frequencybodygyroscopemagnitude-mean

Frequency domain body motion component from the gyroscope signal measurement magnitude-mean

* frequencybodygyroscopemagnitude-standarddeviation

Frequency domain body motion component from the gyroscope signal measurement magnitude-standarddeviation

* frequencybodygyroscopejerk signal magnitude mean

Frequency domain body motion component from the gyroscope signal measurement jerk signal magnitude mean

* frequencybodygyroscopejerk signal magnitude standard deviation

Frequency domain body motion component from the gyroscope signal measurement jerk signal magnitude standard deviation
