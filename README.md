# GCDCProject

By Juan Pedro Vasquez

Course Project
Coursera's Getting and Cleaning Data - 2014-08-15

---


## Abstract
The main goal achieved through the R code contained in the file:

**run_analysis.R**

is to transform the raw data, referent to a human dynamics study that uses accelerometer and gyroscope in smartphones, whose data and detailed info are available in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

into well structured and formatted tidy data, like the contents of the output file:

**secondTidyData.txt**

also, performing aditional operations over such data:

1. discard all the measurements, except the related to mean and standard deviation
2. average the measurements by subject and kind of activity

The variables, and code operations are full described in the file named:

**CodeBook.md**


## Output data
The data in secondTidyData.txt file, is considered tidy, because its characteristics meet the basic criteria list:

1. There is one column for each variable 
2. Each obsevation corresponds to one row
3. Data in each column corresponds to only one data type (atomicity)
4. The variable (column) names are self descriptive 

This file contains 38 rows (averages) and 88 columns (variables).

Despite the name of the columns are self descriptive, full description is showed for most of the variables, in the next list:
subject - number of subject of study [1-30]
activity - factor variable with six possibilities: laying, siting, standing, walking, walking downstairs and walking upstairs
Mean.tBodyAccMeanX - Average of the mean timed acceleration of the body in X component
Mean.tBodyAccMeanY - Average of the mean timed acceleration of the body in Y component
Mean.tBodyAccMeanZ - Average of the mean timed acceleration of the body in Y component
Mean.tBodyAccStdX - Average of the standard deviaton of the timed acceleration of the body in X component
Mean.tBodyAccStdY - Average of the standard deviaton of the timed acceleration of the body in Y component
Mean.tBodyAccStdZ - Average of the standard deviaton of the timed acceleration of the body in Z component
Mean.tGravityAccMeanX - Average of the mean timed acceleration of gravity signal in X component
Mean.tGravityAccMeanY - Average of the mean timed acceleration of gravity signal in Y component
Mean.tGravityAccMeanZ - Average of the mean timed acceleration of gravity signal in Z component
Mean.tGravityAccStdX - Average of the standard deviation of the timed acceleration of gravity signal in X component
Mean.tGravityAccStdY - Average of the standard deviation of the timed acceleration of gravity signal in Y component
Mean.tGravityAccStdZ - Average of the standard deviation of the timed acceleration of gravity signal in Z component
Mean.tBodyAccJerkMeanX - Average of the mean jerk timed acceleration of the body in X component 
Mean.tBodyAccJerkMeanY - Average of the mean jerk timed acceleration of the body in Y component
Mean.tBodyAccJerkMeanZ - Average of the mean jerk timed acceleration of the body in Z component
Mean.tBodyAccJerkStdX - Average of the standar deviation of the jerk timed acceleration of the body in X component
Mean.tBodyAccJerkStdY - Average of the standar deviation of the jerk timed acceleration of the body in Y component
Mean.tBodyAccJerkStdZ - Average of the standar deviation of the jerk timed acceleration of the body in Z component
Mean.tBodyGyroMeanX - Average of the mean of the gyroscope timed signal of the body in X component
Mean.tBodyGyroMeanY - Average of the mean of the gyroscope timed signal of the body in Y component
Mean.tBodyGyroMeanZ - Average of the mean of the gyroscope timed signal of the body in Z component
Mean.tBodyGyroStdX - Average of the standard deviation of the gyroscope timed signal of the body in X component
Mean.tBodyGyroStdY - Average of the standard deviation of the gyroscope timed signal of the body in Y component
Mean.tBodyGyroStdZ - Average of the standard deviation of the gyroscope timed signal of the body in Z component
Mean.tBodyGyroJerkMeanX - Average of the mean jerk on the gyroscope timed signal of the body in X component
Mean.tBodyGyroJerkMeanY - Average of the mean jerk on the gyroscope timed signal of the body in Y component
Mean.tBodyGyroJerkMeanZ - Average of the mean jerk on the gyroscope timed signal of the body in Z component
Mean.tBodyGyroJerkStdX - Average of the standard deviation of jerk on the gyroscope timed signal of the body in X component
Mean.tBodyGyroJerkStdY - Average of the standard deviation of jerk on the gyroscope timed signal of the body in Y component
Mean.tBodyGyroJerkStdZ - Average of the standard deviation of jerk on the gyroscope timed signal of the body in Z component
Mean.tBodyAccMagMean - Average of the mean euclidean magnitud of timed acceleration of the body
Mean.tBodyAccMagStd - Average of the standar deviation of the euclidean magnitud of timed acceleration of the body 
Mean.tGravityAccMagMean - Average of the mean euclidean magnitude of timed acceleration of the gravity singal
Mean.tGravityAccMagStd - Average of the standard deviation of the euclidean magnitude of timed acceleration of the gravity signal 
Mean.tBodyAccJerkMagMean - Average or the mean magnitude of jerk timed acceleration of the body 
Mean.tBodyAccJerkMagStd - Average or the mean magnitude of jerk timed acceleration of the body
Mean.tBodyGyroMagMean - Average of the mean magnitude of gyroscopic timed signal of the body
Mean.tBodyGyroMagStd - Average of the standard deviation of the magnitude of gyroscopic timed signal of the body
Mean.tBodyGyroJerkMagMean - Average of the mean magnitude jerk of the gyroscopic timed signal of the body
Mean.tBodyGyroJerkMagStd - Average of the standard deviation magnitude jerk of the gyroscopic timed signal of the body
Mean.fBodyAccMeanX - Average of the mean fourier domain acceleration of the body in the X component
Mean.fBodyAccMeanY - Average of the mean fourier domain acceleration of the body in the Y component
Mean.fBodyAccMeanZ - Average of the mean fourier domain acceleration of the body in the Z component
Mean.fBodyAccStdX - Average of the standard deviation of the fourier domain acceleration of the body in the X component
Mean.fBodyAccStdY - Average of the standard deviation of the fourier domain acceleration of the body in the Y component
Mean.fBodyAccStdZ - Average of the standard deviation of the fourier domain acceleration of the body in the Z component
Mean.fBodyAccMeanFreqX - Average of the mean frequency of the fourier domain acceleration of the body in the X component
Mean.fBodyAccMeanFreqY - Average of the mean frequency of the fourier domain acceleration of the body in the Y component
Mean.fBodyAccMeanFreqZ - Average of the mean frequency of the fourier domain acceleration of the body in the Z component
Mean.fBodyAccJerkMeanX - Average of the mean jerk fourier domain acceleration of the body in the X component
Mean.fBodyAccJerkMeanY - Average of the mean jerk fourier domain acceleration of the body in the Y component
Mean.fBodyAccJerkMeanZ - Average of the mean jerk fourier domain acceleration of the body in the Z component
Mean.fBodyAccJerkStdX - Average of the standard deviation jerk fourier domain acceleration of the body in the X component
Mean.fBodyAccJerkStdY - Average of the standard deviation jerk fourier domain acceleration of the body in the Y component
Mean.fBodyAccJerkStdZ - Average of the standard deviation jerk fourier domain acceleration of the body in the Z component
Mean.fBodyAccJerkMeanFreqX
Mean.fBodyAccJerkMeanFreqY
Mean.fBodyAccJerkMeanFreqZ
Mean.fBodyGyroMeanX
Mean.fBodyGyroMeanY
Mean.fBodyGyroMeanZ
Mean.fBodyGyroStdX
Mean.fBodyGyroStdY
Mean.fBodyGyroStdZ
Mean.fBodyGyroMeanFreqX
Mean.fBodyGyroMeanFreqY
Mean.fBodyGyroMeanFreqZ
Mean.fBodyAccMagMean
Mean.fBodyAccMagStd
Mean.fBodyAccMagMeanFreq
Mean.fBodyBodyAccJerkMagMean
Mean.fBodyBodyAccJerkMagStd
Mean.fBodyBodyAccJerkMagMeanFreq
Mean.fBodyBodyGyroMagMean
Mean.fBodyBodyGyroMagStd
Mean.fBodyBodyGyroMagMeanFreq
Mean.fBodyBodyGyroJerkMagMean
Mean.fBodyBodyGyroJerkMagStd
Mean.fBodyBodyGyroJerkMagMeanFreq
Mean.angletBodyAccMeanGravity
Mean.angletBodyAccJerkMeanGravityMean
Mean.angletBodyGyroMeanGravityMean
Mean.angletBodyGyroJerkMeanGravityMean
Mean.angleXGravityMean
Mean.angleYGravityMean
Mean.angleZGravityMean


