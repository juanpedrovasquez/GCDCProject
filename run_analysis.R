# DOWNLOADS THE DATA FILE, UNZIPS IT INTO A FOLDER WITHOUT SUBFOLDERS------
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if( !file.exists('data.zip') & !file.exists('data/') ){ # CHECKS IF THE FILE AND THE FOLDER ALREADY EXISTS
        download.file(url = url, destfile = 'data.zip', method = 'wget') # DOWNLOADS THE ZIP FILE FROM THE WEB
        unzip(zipfile = 'data.zip', exdir = 'data', junkpaths = TRUE) # EACH FILE HAS A DISTINCT NAME, SO IT'S OK TO UNZIP THEM ALL INTO ONE SINGLE FOLDER
}

# READS THE TEST DATA -----------------------------------------------------
measurements <- read.table('data/X_test.txt') 
activities <- read.table('data/y_test.txt') 
subjects <- read.table('data/subject_test.txt')  

# APPENDS THE TRAIN DATA --------------------------------------------------
measurements <- rbind(measurements,read.table('data/X_train.txt'))
activities <- rbind(activities,read.table('data/y_train.txt'))
subjects <- rbind(subjects, read.table('data/subject_train.txt'))

# SUBSETS THE FEATURES RELATED TO MEAN AND STD ----------------------------
features <- read.table('data/features.txt')
features.columns<-features[grep("[M,m]ean",features[,2]),1] # INCLUDES FEATURES WITH 'Mean' AND 'mean'
features.columns<-append(features.columns,features[grep("[S,s]td",features[,2]),1] )
features.columns<-sort(features.columns) # JUST FOR BETTER LOOKING: ORIGINAL ORDER OF COLUMNS
measurements <- measurements[,features.columns] # ACTUAL SUBSETTING

# TRANSFORMS THE FEATURES INTO "VALID NAMES" FOR COLUMNS ------------------
features.names<-features[features.columns,2] # ONLY THE COLS OF INTEREST
features.names <- gsub("mean","Mean",features.names) # LOOKING TO GET CAMEL STYLE, CORRECTS SOME INITIALS
features.names <- gsub("std","Std",features.names) #
features.names <- gsub("gravity","Gravity",features.names) #
features.names <- make.names(features.names) # THIS FUNCTION REPLACES THE OTHER MESSY CHARACTERS LIKE PARENTHESIS
features.names <- gsub("\\.","",features.names) # CLEANS THE REMAIN DOTS

# TRANSFORMS THE ACTIVITIES NUMBERS INTO ACTUAL ACTIVITIES NAMES ----------
activities.labels <- read.table('data/activity_labels.txt') # CATALOG OF ACTIVITY NUMBER, ACTIVITY NAME
activities <- matrix(merge(activities,activities.labels)[,2],ncol=1) # THIS MERGES THEM BY THE COMMON COLUMN: ACTIVITY NUMBER

# PUTS ALL TOGETHER: SUBJECTS, ACTIVITIES AND DATA ------------------------
tidyData <- cbind(subjects,activities,measurements) # FIRST TIDY DATA: ONE COLUMN PER VARIABLE, VALID NAMES, ONE ROW PER MEASUREMENT, ONE TABLE
names(tidyData) <- append(c("subject","activity"),features.names) # WITH VALID COLUMN NAMES

# GENERATES THE SECOND TIDY DATA SET WITH AVERAGES ------------------------
secondTidyData<-data.frame() # EMPTY DATA.FRAME
colsAvg=3:dim(part)[2] # THE MEAN IS APPLIED ONLY TO COLUMNS: 3RD TO LAST ONE
for (s in unique(tidyData$subject)){ 
        chunk <- with(tidyData,tidyData[subject==s,]) # SUBSETTING BY EACH SUBJECT
        for (a in unique(chunk$activity)){
                part <- with(chunk, chunk[activity==a,]) # SUB-SUBSETTING BY EACH ACTIVITY
                tag <- part[1,1:2] # FIRST TWO COLUMS HAVE THE SAME VALUE, SO THE FIRST ROW IS ENOUGH
                average<-as.data.frame(sapply(part[,colsAvg],mean,simplify = FALSE)) # APPLIES MEAN 
                secondTidyData <- rbind(secondTidyData,cbind(tag,average)) # RECONSTRUCTS THE ONE-ROW RESULT
        }
}
secondTidyData <- secondTidyData[order(secondTidyData[,1], secondTidyData[,2]),] # JUST FOR BETTER LOOKING: ORDERED BY SUBJECT AND ACTIVITY
names(secondTidyData)[colsAvg] <- sapply(names(secondTidyData)[colsAvg],function (x) paste('Mean.',x,sep="") ) # ADDS "Mean." TO EVERY MEASUREMENT COLUMN
write.table(secondTidyData,'secondTidyData.txt',row.names = FALSE) # CREATES TEXT FILE WITH FINAL RESULT

