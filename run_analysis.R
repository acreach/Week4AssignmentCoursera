library(dplyr)
library(reshape2)

## STEP 1 : Merges the training and the test sets to create one data set. 
##################################################################################
##################################################################################

# creating the training set

## loading the files needed
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt") 
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt") 
features <- read.table("./UCI HAR Dataset/features.txt") 
subjectstrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") 

## renaming columns of tables created
subjectstrain <- rename(subjectstrain, "idSubject" = "V1")
ytrain <- rename(ytrain, "idActivity" = "V1")

## for xtrain data set, getting the column names from the features.txt file
namesfeatures <- features$V2
names(xtrain) <- namesfeatures

## merging all the training data into a single data table traindataset
traindataset <- cbind(ytrain,subjectstrain,xtrain)

##################################################################################

# creating the test set

ytest <- read.table("./UCI HAR Dataset/test/y_test.txt") 
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
subjectstest <- read.table("./UCI HAR Dataset/test/subject_test.txt") 

## renaming columns of tables created
subjectstest <- rename(subjectstest, "idSubject" = "V1")
ytest <- rename(ytest, "idActivity" = "V1")

## for xtest data set, getting the column names from the features.txt file
namesfeatures <- features$V2
names(xtest) <- namesfeatures

## merging all the test data into a single data table testdataset
testdataset <- cbind(ytest,subjectstest,xtest)

##################################################################################

# merging training and set test into one data set
finaldataset <- rbind(traindataset,testdataset)


## STEP 2 : Extracts only the measurements on the mean and standard deviation for each measurement. 
##################################################################################
##################################################################################

# keeping only mean and standard deviation measurements using grep and regex
meansandstd <- finaldataset[,grep('-mean\\(|-std\\(|idActivity|idSubject', names(finaldataset), value=TRUE)]


## STEP 3 : Uses descriptive activity names to name the activities in the data set. 
##################################################################################
##################################################################################

# loading activity_labels.txt that contains all the labels of the activities plus their ID
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

activities <- rename(activities, "idActivity" = "V1","nameActivity" = "V2")

# merging activity ID from meansandstd and activity ID from the freshly created activities data table
meansandstd = merge(meansandstd,activities,by.x = "idActivity", by.y = "idActivity", all=TRUE)

## STEP 4 : Appropriately labels the data set with descriptive variable names. 
##################################################################################
##################################################################################

# getting rid of parenthesis and minus signs, applying a correct camel case, inserting underscore signs to delimitate operation (Mean or Std) 
# and direction (X,Y,Z), replacing f by freq and t by time

namesmeansandstd <- names(meansandstd)

namesmeansandstd <- gsub("-([a-z])","_\\U\\1",namesmeansandstd,perl=TRUE)
namesmeansandstd <- gsub("\\(\\)","",namesmeansandstd)
namesmeansandstd <- gsub("-","_",namesmeansandstd)
namesmeansandstd <- gsub("^t","time",namesmeansandstd)
namesmeansandstd <- gsub("^f","freq",namesmeansandstd)

names(meansandstd) <- namesmeansandstd

# reordering column names by putting subject and activity information first

firstcolumns <- c("idSubject", "idActivity", "nameActivity")
meansandstd <- meansandstd[, c(refcols, setdiff(names(meansandstd), firstcolumns))]

## STEP 5 : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##################################################################################
##################################################################################

# creating a second tidy data set containing average of each variable by subject and activity
avgmeansandstd <- meansandstd %>%  group_by(idActivity, nameActivity,idSubject ) %>%  summarise_all("mean")
