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

The variables are full described in the file named:

**CodeBook.md**


## How the program works

The tasks carried out by the code in **run_analysis.R** may be described by main sections:

1. DOWNLOADS THE DATA FILE, UNZIPS IT INTO A FOLDER WITHOUT SUB-SUBFOLDERS 
 - Checks if the data has been downloaded before (zip file and correspondent subfolder), and if it hasn't then
 - downloads the data from the web, 
 - and as each file has a distinct name, it's ok to unzip all of them into one single folder named 'data'.
2. READS THE TEST DATA 
3. APPENDS THE TRAIN DATA
4. SUBSETS THE FEATURES RELATED TO MEAN AND STD
 - Looking for column names that includes 'mean', 'Mean', 'std' and 'Std' strings
5. TRANSFORMS THE FEATURES INTO "VALID NAMES" FOR COLUMNS
 - Uppercase the initials of some words 
 - Deleting parenthesis and other messy characters throug make.names function
6. TRANSFORMS THE ACTIVITIES NUMBERS INTO ACTUAL ACTIVITIES NAMES
 - By merging the catalog of activities in *activity_labels.txt* file and the column with the number of kind of activity.
7. PUTS ALL TOGETHER: SUBJECTS, ACTIVITIES AND MEASUREMENTS
 - Using cbind function
8. GENERATES THE SECOND TIDY DATA SET WITH AVERAGES PER COLUMN
 - With a two nested loop that hashes the tidy data by subject and kind of activity
 - Then, as a matrix apart, averages the measurements with sapply function
 - For each hash, completes the single-row output for each iteration 
 - and adds "Mean." to the column name for better description
 - after all the loops are done, writes down all the output rows into 'secondTidyData.txt' file  
