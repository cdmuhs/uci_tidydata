# 11/24/17, C. Muhs
# Coursera | Getting and Cleaning Data
# Course project - Human Activity Recognition Dataset
################################################################################
#    This script:
#        1. Merges the training and the test sets to create one data set
#        2. Extracts only the measurements on the mean and standard deviation
#            for each measurement.
#        3. Uses descriptive activity names to name the activities in the 
#            data set
#        4. Appropriately labels the data set with descriptive variable names
#        5. Create a second, independent tidy data set with the average of 
#            each variable for each activity and each subject.
################################################################################

# Read data
################################################################################
setwd("~/Dropbox/Data_Science/getting_and_cleaning_data/project")

features <- read.table("./data/features.txt")
subject_train <- read.table("./data/train/subject_train.txt")
x_train <- read.table("./data/train/X_train.txt")
y_train <- read.table("./data/train/y_train.txt")
subject_test <- read.table("./data/test/subject_test.txt")
x_test <- read.table("./data/test/X_test.txt")
y_test <- read.table("./data/test/y_test.txt")

# 1. "Merge" training and test data together to create one data set
################################################################################

# Append data together vertically
s <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)

# Change column names for id fields
colnames(s) <- "subject_id"
colnames(y) <- "activity_id"
colnames(x) <- features$V2

# Combine data horizontally into one data set
mydata <- cbind(s, y, x)

# 2. Extract the measurements on the mean and standard deviation from dataset
################################################################################

# Make list of variables with "mean()" and "std()" in the name
keyvars <- grep("(mean\\(\\))|(std\\(\\))", features$V2, value = T)
# Make list of the variables above and the id variables
id_keyvars <- c(colnames(mydata)[1:2], keyvars )
# Make index of columns of interest based on these column names 
col_num <- which(colnames(mydata) %in% id_keyvars)
# Extract data based on index of columns
keydata <- mydata[, c(col_num)]

# dim(keydata)
# head(keydata)

# 3. Use descriptive activity names to name the activities
################################################################################
# Read activity names 
activity_names <- read.table("./data/activity_labels.txt")
# Make lower case for tidiness
activity_names$lc <- tolower(activity_names$V2)
# Make activity_id a factor with these labels
keydata$activity_id <- factor(keydata$activity_id, 
                              levels = activity_names$V1, 
                              labels = activity_names$lc)

# 4. Label data set with descriptive variable names
################################################################################
# Make list of variables to work with
vars <- names(keydata)
# Make lowercase
vars <- tolower(vars)
# Replace leading "t" and "f" with descriptor
vars <- gsub("^t", "time_", vars)
vars <- gsub("^f", "freq_", vars)
# Remove parentheses
vars <- gsub("\\(\\)", "", vars) 
# Replace "-" with "_"
vars <- gsub("-", "_", vars)
# Add underscores btw terms
vars <- gsub("body", "body_", vars)
vars <- gsub("gravity", "grav_", vars)
vars <- gsub("jerk", "_jerk", vars)
vars <- gsub("mag", "_mag", vars)
# vars
# Assign as column names
colnames(keydata) <- vars
head(keydata)

# 5. Create second, independent tidy data set w/ avg of each variable for 
#    each activity and each subject
################################################################################
library(tidyverse)
tidydata <- keydata %>%
    group_by(subject_id, activity_id) %>% # for unique combinations of subject and activity
    summarise_all(funs(mean)) # take average of corresponding rows for all non-id columns

# save data
write.table(tidydata, file = "./aggregated_activity_data.txt", row.names = FALSE)

# Clean up
rm(list = ls())

# Test reading the saved tidy dataset
read.table("./aggregated_activity_data.txt", header = TRUE)